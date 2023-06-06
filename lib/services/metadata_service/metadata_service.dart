import '../../core/services/api_service/api_service.dart';
import '../../core/utils/instance_controller.dart';
import '../../models/metadata/metadata_model.dart';
import '../api_service/calls/metadata/search_metadata_api_call.dart';

class MetadataService {
  final ApiService _apiService = InstanceController().getByType<ApiService>();
  Future<List<MetadataModel>> searchMetadata(String query) async {
    final ResponseObject response = await _apiService.call(
        const SearchMetadataApiCall(), SearchMetadataApiCallArgs(query: query));

    if (response.statusCode ~/ 100 == 2) {
      return response.data;
    }
    return Future.error(response.error_code ?? 'UNKNOWN_ERROR');
  }
}
