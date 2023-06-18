import 'package:dio/dio.dart';

import '../../../../core/services/api_service/api_service.dart';
import '../../../../models/stream/byte_stream_model.dart';

class StreamApiCall extends IApiCall<ByteStreamModel> {
  const StreamApiCall()
      : super(
          name: 'StreamApiCall',
          method: HttpMethods.GET,
          path: '/bff/songs/{id}/stream',
          requiresArgs: true,
          responseType: ResponseType.bytes,
        );

  @override
  ResponseObject<ByteStreamModel>? parse(Response response) {
    if (response.data != null) {
      return ResponseObject<ByteStreamModel>.success(
          statusCode: response.statusCode ?? 200,
          data: ByteStreamModel(
            bytes: response.data as List<int>,
            contentLength:
                response.data.lengthInBytes ?? response.data.length ?? 0,
          ));
    }
    return ResponseObject.error(statusCode: response.statusCode ?? 500);
  }
}

class StreamApiCallArgs extends IApiCallArgs {
  final int? rangeStart;
  final int? rangeEnd;
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
      'Range': 'bytes=${rangeStart ?? 0}-${rangeEnd ?? ''}',
    };
  }
}
