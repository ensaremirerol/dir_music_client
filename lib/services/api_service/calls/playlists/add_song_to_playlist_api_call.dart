import 'package:dio/dio.dart';

import '../../../../core/services/api_service/api_service.dart';
import '../../../../models/playlists/playlist_base_model/playlist_base_model.dart';

class AddSongToPlaylistApiCall extends IApiCall<PlaylistBaseModel> {
  const AddSongToPlaylistApiCall()
      : super(
          name: 'AddSongToPlaylistApiCall',
          method: HttpMethods.POST,
          path: '/bff/playlists/{playlistId}/add/{songId}',
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

class AddSongToPlaylistApiCallArgs extends IApiCallArgs {
  final String playlistId;
  final int songId;

  const AddSongToPlaylistApiCallArgs({
    required this.playlistId,
    required this.songId,
  }) : super(name: 'AddSongToPlaylistApiCall');

  @override
  String pathFormat(String path) {
    return path
        .replaceAll('{playlistId}', playlistId)
        .replaceAll('{songId}', songId.toString());
  }
}
