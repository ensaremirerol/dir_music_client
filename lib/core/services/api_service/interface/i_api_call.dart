part of '../api_service.dart';

abstract class IApiCall<T> {
  const IApiCall(
      {required this.name,
      required this.path,
      required this.method,
      required this.requiresArgs});

  final String name;
  final String path;
  final HttpMethods method;
  final bool requiresArgs;

  ResponseObject<T>? parse(Response response) {
    return null;
  }
}
