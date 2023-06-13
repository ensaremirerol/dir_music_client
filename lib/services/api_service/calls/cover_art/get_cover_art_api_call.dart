import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/api_service/api_service.dart';

class GetCoverArtApiCall extends IApiCall<MemoryImage> {
  const GetCoverArtApiCall()
      : super(
          name: 'GetCoverArtApiCall',
          method: HttpMethods.GET,
          path: '/bff/musicArt/gimme/{id}',
          requiresArgs: true,
          responseType: ResponseType.bytes,
        );

  @override
  ResponseObject<MemoryImage>? parse(Response response) {
    if (response.data != null) {
      return ResponseObject.success(
          statusCode: response.statusCode ?? 200,
          data: MemoryImage(response.data));
    }

    return ResponseObject.error(statusCode: response.statusCode ?? 500);
  }
}

class GetCoverArtApiCallArgs extends IApiCallArgs {
  final String id;

  const GetCoverArtApiCallArgs({
    required this.id,
  }) : super(name: 'GetCoverArtApiCall');

  @override
  String pathFormat(String path) {
    return path.replaceAll('{id}', id);
  }
}
