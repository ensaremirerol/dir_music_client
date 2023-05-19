import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../utils/instance_controller.dart';
import '../event_pipe/event_pipe.dart';

part './interface/i_api_call.dart';
part './interface/i_api_call_args.dart';
part 'models/response_object.dart';
part './interceptors/refresh_token_interceptor.dart';
part './enums/http_methods.dart';

/// A function that returns a bearer token
///
/// Should return null in case of failure
typedef BearerToken = FutureOr<String?> Function();

typedef ErrorResponseBuilder = ResponseObject Function(Response response);

class ApiService {
  late Dio _dio;

  final Logger _logger = InstanceController().getByType<Logger>();

  final BearerToken? _refreshBearerToken;

  final ErrorResponseBuilder? _errorResponseBuilder;

  final String _baseUrl;

  bool _initialized = false;

  String? _bearerToken;

  ApiService(
      {required String baseUrl,
      BearerToken? refreshBearerToken,
      ErrorResponseBuilder? errorResponseBuilder,
      String? bearerToken})
      : _baseUrl = baseUrl,
        _refreshBearerToken = refreshBearerToken,
        _errorResponseBuilder = errorResponseBuilder,
        _bearerToken = bearerToken;

  void init() {
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    _initInterceptors();
    if (_bearerToken != null) {
      bearerToken = _bearerToken!;
    }
    _log('Initialized');
    _initialized = true;
  }

  ResponseObject _argNameError(String apiCallName, String argName) {
    _log(
        'IApiCall name and IApiCallArgs name do not match. apiCall.name: ${apiCallName}, args.name: ${argName}}',
        level: Level.error);
    return const ResponseObject.error(
        statusCode: -1, error_code: 'INTERNAL_API_CALL_NAME_MISMATCH');
  }

  ResponseObject _argRequiredError(String apiCallName) {
    _log(
        'IApiCall requires args but none were provided. apiCall.name: ${apiCallName}',
        level: Level.error);
    return const ResponseObject.error(
        statusCode: -1, error_code: 'INTERNAL_API_CALL_ARGS_REQUIRED');
  }

  FutureOr<ResponseObject> call(IApiCall apiCall, IApiCallArgs? args) async {
    if (!_initialized) {
      _log('ApiService not initialized', level: Level.error);
      return const ResponseObject.error(
          statusCode: -1, error_code: 'INTERNAL_API_SERVICE_NOT_INITIALIZED');
    }
    try {
      if ((args != null && apiCall.name != args.name)) {
        return _argNameError(apiCall.name, args.name);
      }
      if (apiCall.requiresArgs && args == null) {
        return _argRequiredError(apiCall.name);
      }
      _log('Calling apiCall: ${apiCall.name}');
      final Response response = await _dio.request(
        args?.pathFormat(apiCall.path) ?? apiCall.path,
        data: jsonEncode(args?.getBody()),
        queryParameters: args?.getQueryParameters(),
        options: Options(
          method: apiCall.method.name,
        ),
      );
      if ((response.statusCode ?? 0) ~/ 100 != 2) {
        _log(
            'ApiCall: ${apiCall.name} completed with status code:'
            '${response.statusCode}\nresponse: ${response.data}',
            level: Level.error);
        final ResponseObject? parsedData = apiCall.parse(response);
        if (parsedData != null) {
          return parsedData;
        }
        return ResponseObject.error(
            statusCode: response.statusCode ?? 200, error_code: 'PARSE_ERROR');
      }
      final ResponseObject errorResponse =
          _errorResponseBuilder?.call(response) ??
              ResponseObject.error(
                  statusCode: response.statusCode ?? 0,
                  error_code: 'API_CALL_ERROR');

      return errorResponse;
    } on DioError catch (e) {
      _log('ApiCall: ${apiCall.name} failed with DioError: $e',
          level: Level.error);

      final ResponseObject errorResponse =
          _errorResponseBuilder?.call(e.response!) ??
              ResponseObject.error(
                  statusCode: e.response?.statusCode ?? -1,
                  error_code: 'API_CALL_ERROR');
      return errorResponse;
    } catch (e) {
      _log('ApiCall: ${apiCall.name} failed with error: $e',
          level: Level.error);
      return const ResponseObject.error(
          statusCode: -1, error_code: 'UNKNOWN_API_CALL_ERROR');
    }
  }

  set bearerToken(String token) {
    if (token.startsWith('Bearer')) {
      _bearerToken = token;
      _dio.options.headers['Authorization'] = _bearerToken;
      return;
    }
    _bearerToken = 'Bearer $token';
    _dio.options.headers['Authorization'] = _bearerToken;
    _log('Bearer token set');
  }

  void _initInterceptors() {
    if (_refreshBearerToken != null) {
      _dio.interceptors
          .add(RefreshTokenInterceptor(_dio, _refreshBearerToken!));
    }
    _log('Interceptors initialized');
  }

  void _log(String message, {Level level = Level.debug}) {
    _logger.log(level, '<ApiService>: $message');
  }
}
