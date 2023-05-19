part of '../api_service.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Dio _dio;
  final BearerToken _refreshBearerToken;
  final Logger _logger = InstanceController().getByType<Logger>();
  final EventPipe _eventPipe = InstanceController().getByType<EventPipe>();
  RefreshTokenInterceptor(this._dio, this._refreshBearerToken);

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      _log('Received 401, refreshing token');
      final String? token = await _refreshBearerToken();
      if (token == null) {
        _log('Could not refresh token, logging out');
        _eventPipe.emit(EventItem<String>(
            type: EventTypes.error,
            from: this.runtimeType,
            event: 'Could not refresh token, logging out'));
        return super.onError(err, handler);
      }
      _dio.options.headers['Authorization'] = 'Bearer $token';
      _log('Token refreshed, retrying request');
      return _dio
          .fetch(err.requestOptions)
          .then((value) => handler.resolve(value));
    }
    return super.onError(err, handler);
  }

  void _log(String message, {Level level = Level.debug}) {
    _logger.log(level, '<RefreshTokenInterceptor>: $message');
  }
}
