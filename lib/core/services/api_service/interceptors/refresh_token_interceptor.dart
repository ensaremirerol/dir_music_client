part of '../api_service.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Dio _dio;
  final BearerToken _refreshBearerToken;
  final Logger _logger = InstanceController().getByType<Logger>();
  final EventPipe _eventPipe = EventPipe();
  final ApiService _apiService;
  RefreshTokenInterceptor(
      this._dio, this._apiService, this._refreshBearerToken);

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        _dio.options.headers['Authorization'] != null) {
      _log('Received 401, refreshing token');
      final String? token = await _refreshBearerToken(_apiService);
      if (token == null) {
        _log('Could not refresh token, logging out');
        _eventPipe.emit(EventItem<String>(
            type: EventTypes.error,
            from: this.runtimeType,
            event: 'Could not refresh token, logging out'));
        return super.onError(err, handler);
      }
      _log('Token refreshed, retrying request');
      _apiService.bearerToken = 'Bearer $token';
      InstanceController().getByType<AuthService>().saveBearerToken(token);
      final RequestOptions options = err.requestOptions;
      options.headers['Authorization'] = 'Bearer $token';
      final resolve = await _dio.fetch(err.requestOptions);
      return handler.resolve(resolve);
    }
    return super.onError(err, handler);
  }

  void _log(String message, {Level level = Level.debug}) {
    _logger.log(level, '<RefreshTokenInterceptor>: $message');
  }
}
