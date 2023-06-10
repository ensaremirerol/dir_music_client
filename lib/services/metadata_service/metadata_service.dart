import '../../core/services/api_service/api_service.dart';
import '../../core/utils/instance_controller.dart';
import '../../models/metadata/metadata_model.dart';
import '../api_service/calls/metadata/get_metadata_api_call.dart';
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

  Future<List<MetadataModel>> getListedMetadata(List<int> ids) async {
    final ResponseObject response = await _apiService.call(
        const GetMetadataApiCall(), GetMetadataApiCallArgs(ids: ids));

    if (response.statusCode ~/ 100 == 2) {
      final List<MetadataModel> result = response.data;
      return ids
          .map((e) => result.firstWhere((element) => element.id == e))
          .toList();
    }
    return Future.error(response.error_code ?? 'UNKNOWN_ERROR');
  }
}
