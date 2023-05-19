part of '../api_service.dart';

enum HttpMethods {
  GET,
  POST,
  PUT,
  DELETE,
  PATCH,
  HEAD,
  OPTIONS,
  CONNECT,
  TRACE
}

extension HttpMethodsExtension on HttpMethods {
  String get name {
    switch (this) {
      case HttpMethods.GET:
        return 'GET';
      case HttpMethods.POST:
        return 'POST';
      case HttpMethods.PUT:
        return 'PUT';
      case HttpMethods.DELETE:
        return 'DELETE';
      case HttpMethods.PATCH:
        return 'PATCH';
      case HttpMethods.HEAD:
        return 'HEAD';
      case HttpMethods.OPTIONS:
        return 'OPTIONS';
      case HttpMethods.CONNECT:
        return 'CONNECT';
      case HttpMethods.TRACE:
        return 'TRACE';
    }
  }
}
