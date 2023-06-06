import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:flutter/services.dart';

import '../../../../core/services/api_service/api_service.dart';

class StreamApiCall extends IApiCall<Uint8List> {
  const StreamApiCall()
      : super(
          name: 'StreamApiCall',
          method: HttpMethods.GET,
          path: '/bff/songs/{id}/stream',
          requiresArgs: true,
          responseType: ResponseType.bytes,
        );

  @override
  ResponseObject<Uint8List>? parse(Response response) {
    if (response.data != null) {
      return ResponseObject<Uint8List>.success(
          statusCode: response.statusCode ?? 200,
          data: response.data as Uint8List);
    }
    return ResponseObject.error(statusCode: response.statusCode ?? 500);
  }
}

class StreamApiCallArgs extends IApiCallArgs {
  final int rangeStart;
  final int rangeEnd;
  final String id;

  const StreamApiCallArgs({
    required this.rangeStart,
    required this.rangeEnd,
    required this.id,
  }) : super(name: 'StreamApiCall');

  @override
  String pathFormat(String path) {
    return path.replaceAll('{id}', id);
  }

  @override
  Map<String, dynamic>? getHeaders() {
    return {
      'Range': 'bytes=$rangeStart-$rangeEnd',
    };
  }
}
