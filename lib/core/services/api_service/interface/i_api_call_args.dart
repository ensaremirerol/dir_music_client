part of '../api_service.dart';

abstract class IApiCallArgs<T> {
  final String name;

  const IApiCallArgs({required this.name});

  T? getBody() {
    return null;
  }

  Map<String, dynamic>? getQueryParameters() {
    return null;
  }

  String pathFormat(String path) {
    return path;
  }
}
