part of '../api_service.dart';

abstract class IApiCall<T> {
  const IApiCall(
      {required this.name,
      required this.path,
      required this.method,
      required this.requiresArgs,
      this.responseType = ResponseType.json});

  final String name;
  final String path;
  final HttpMethods method;
  final bool requiresArgs;
  final ResponseType responseType;

  ResponseObject<T>? parse(Response response) {
    return null;
  }
}
