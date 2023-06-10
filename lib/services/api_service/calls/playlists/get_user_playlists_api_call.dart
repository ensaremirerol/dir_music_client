import 'package:dio/src/response.dart';

import '../../../../core/services/api_service/api_service.dart';
import '../../../../models/playlists/playlist_base_model/playlist_base_model.dart';

class GetUserPlaylistsApiCall extends IApiCall<List<PlaylistBaseModel>> {
  const GetUserPlaylistsApiCall()
      : super(
          name: 'GetUserPlaylistsApiCall',
          method: HttpMethods.POST,
          path: '/bff/playlists/user/me',
          requiresArgs: false,
        );

  @override
  ResponseObject<List<PlaylistBaseModel>>? parse(Response response) {
    if (response.data != null) {
      return ResponseObject.success(
          statusCode: response.statusCode ?? 200,
          data: response.data['playlists']
              .map<PlaylistBaseModel>((e) => PlaylistBaseModel.fromJson(e))
              .toList());
    }
    return ResponseObject.error(statusCode: response.statusCode ?? 500);
  }
}
