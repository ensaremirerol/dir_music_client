part of '../api_service.dart';

class ResponseObject<T> {
  const ResponseObject({this.data, required this.statusCode, this.error_code});

  const ResponseObject.error({required this.statusCode, this.error_code})
      : data = null;

  const ResponseObject.success({required this.statusCode, this.data})
      : error_code = null;

  final T? data;
  final String? error_code;
  final int statusCode;
}
