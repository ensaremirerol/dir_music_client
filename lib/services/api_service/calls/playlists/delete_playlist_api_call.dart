import 'package:dio/src/response.dart';

import '../../../../core/services/api_service/api_service.dart';

class DeletePlaylistApiCall extends IApiCall {
  const DeletePlaylistApiCall()
      : super(
          name: 'DeletePlaylistApiCall',
          method: HttpMethods.DELETE,
          path: '/bff/playlists/{playlistId}/delete',
          requiresArgs: true,
        );

  @override
  ResponseObject? parse(Response response) {
    if (response.data != null) {
      return ResponseObject.success(
        statusCode: response.statusCode ?? 200,
      );
    }
    return ResponseObject.error(statusCode: response.statusCode ?? 500);
  }
}

class DeletePlaylistApiCallArguments extends IApiCallArgs {
  const DeletePlaylistApiCallArguments({required this.playlistId})
      : super(name: 'DeletePlaylistApiCall');
  final String playlistId;

  @override
  String pathFormat(String path) {
    return path.replaceAll('{playlistId}', playlistId);
  }
}
