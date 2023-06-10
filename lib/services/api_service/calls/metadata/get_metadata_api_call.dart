import 'package:dio/src/response.dart';

import '../../../../core/services/api_service/api_service.dart';
import '../../../../models/metadata/metadata_model.dart';

class GetMetadataApiCall extends IApiCall<List<MetadataModel>> {
  const GetMetadataApiCall()
      : super(
          name: 'GetMetadataApiCall',
          method: HttpMethods.POST,
          path: '/bff/metadata/get',
          requiresArgs: true,
        );

  @override
  ResponseObject<List<MetadataModel>>? parse(Response response) {
    if (response.data != null) {
      return ResponseObject.success(
          statusCode: response.statusCode ?? 200,
          data: response.data['results']
              .map<MetadataModel>((e) => MetadataModel.fromJson(e))
              .toList());
    }
    return ResponseObject.error(statusCode: response.statusCode ?? 500);
  }
}

class GetMetadataApiCallArgs extends IApiCallArgs {
  final List<int> ids;

  const GetMetadataApiCallArgs({
    required this.ids,
  }) : super(name: 'GetMetadataApiCall');

  @override
  getBody() {
    return ids;
  }
}
