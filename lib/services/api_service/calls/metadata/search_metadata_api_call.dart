import 'package:dio/src/response.dart';

import '../../../../core/services/api_service/api_service.dart';
import '../../../../models/metadata/metadata_model.dart';

class SearchMetadataApiCall extends IApiCall<List<MetadataModel>> {
  const SearchMetadataApiCall()
      : super(
          name: 'SearchMetadataApiCall',
          method: HttpMethods.GET,
          path: '/bff/search/{query}',
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

class SearchMetadataApiCallArgs extends IApiCallArgs {
  final String query;

  const SearchMetadataApiCallArgs({
    required this.query,
  }) : super(name: 'SearchMetadataApiCall');

  @override
  String pathFormat(String path) {
    return path.replaceAll('{query}', query);
  }
}
