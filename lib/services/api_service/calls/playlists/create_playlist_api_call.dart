import 'package:dio/dio.dart';

import '../../../../core/services/api_service/api_service.dart';
import '../../../../models/playlists/playlist_base_model/playlist_base_model.dart';

class CreatePlaylistApiCall extends IApiCall<PlaylistBaseModel> {
  const CreatePlaylistApiCall()
      : super(
          name: 'CreatePlaylistApiCall',
          method: HttpMethods.POST,
          path: '/bff/playlists/create',
          requiresArgs: true,
        );

  @override
  ResponseObject<PlaylistBaseModel>? parse(Response response) {
    if (response.data != null) {
      return ResponseObject.success(
          statusCode: response.statusCode ?? 200,
          data: PlaylistBaseModel.fromJson(response.data));
    }
    return ResponseObject.error(statusCode: response.statusCode ?? 500);
  }
}

class CreatePlaylistApiCallArgs extends IApiCallArgs {
  final String playlistName;
  final String username;
  final bool isPublic;


  const CreatePlaylistApiCallArgs({
    required this.playlistName,
    required this.username,
    required this.isPublic,
  }) : super(name: 'CreatePlaylistApiCall');

  @override
  getBody() {
    return {
      'playlistName': playlistName,
      'userName': username,
      'isPublic': isPublic,
    };
  }
}
