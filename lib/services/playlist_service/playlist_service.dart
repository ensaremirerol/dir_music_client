import 'dart:async';

import 'package:logger/logger.dart';

import '../../core/services/api_service/api_service.dart';
import '../../core/utils/instance_controller.dart';
import '../../models/metadata/metadata_model.dart';
import '../../models/playlists/playlist_base_model/playlist_base_model.dart';
import '../../models/playlists/playlist_detailed_model/playlist_detailed_model.dart';
import '../api_service/calls/playlists/add_song_to_playlist_api_call.dart';
import '../api_service/calls/playlists/create_playlist_api_call.dart';
import '../api_service/calls/playlists/delete_playlist_api_call.dart';
import '../api_service/calls/playlists/get_user_playlists_api_call.dart';
import '../api_service/calls/playlists/remove_song_from_platlist_api_call.dart';
import '../metadata_service/metadata_service.dart';
import '../user_service/user_service.dart';

class PlaylistService {
  List<PlaylistBaseModel> _playlists;
  List<PlaylistDetailedModel> _detailedPlaylists;

  final ApiService _apiService = InstanceController().getByType<ApiService>();
  final MetadataService _metadataService =
      InstanceController().getByType<MetadataService>();
  final UserService _userService =
      InstanceController().getByType<UserService>();
  final Logger _logger = InstanceController().getByType<Logger>();

  PlaylistService()
      : _playlists = [],
        _detailedPlaylists = [];

  FutureOr<List<PlaylistBaseModel>> getBasePlaylists() async {
    if (_playlists.isEmpty) {
      await _getDetailedPlaylists();
    }
    return _playlists;
  }

  FutureOr<List<PlaylistDetailedModel>> getDetailedPlaylists() async {
    if (_detailedPlaylists.isEmpty) {
      await _getDetailedPlaylists();
    }
    return _detailedPlaylists;
  }

  FutureOr<List<PlaylistDetailedModel>> get detailedPlaylists =>
      getDetailedPlaylists();

  Future<List<PlaylistDetailedModel>> _getDetailedPlaylists() async {
    _log('Getting playlists');
    final ResponseObject playlists =
        await _apiService.call(const GetUserPlaylistsApiCall(), null);

    if (playlists.statusCode ~/ 100 == 2) {
      _playlists = playlists.data;
    } else {
      return Future.error(playlists.error_code ?? 'UNKNOWN_ERROR');
    }

    final List<Future<PlaylistDetailedModel>> metadata = [
      for (PlaylistBaseModel playlist in _playlists) _getDetailedModel(playlist)
    ];

    final List<PlaylistDetailedModel> detailedPlaylist =
        await Future.wait(metadata);

    _detailedPlaylists = detailedPlaylist;
    _log('Got playlists');
    return detailedPlaylist;
  }

  Future<PlaylistDetailedModel> _getDetailedModel(
      PlaylistBaseModel model) async {
    final List<MetadataModel> metadata =
        await _metadataService.getListedMetadata(model.songIds);

    return PlaylistDetailedModel(
      playlistId: model.playlistId,
      public: model.public,
      playlistName: model.playlistName,
      songs: metadata,
      userId: model.userId,
      userName: model.userName,
    );
  }

  void _log(String message, {Level level = Level.debug}) {
    _logger.log(level, '<PlaylistService>: $message');
  }

  Future<PlaylistDetailedModel> createPlaylist(
      String playlistName, bool isPublic) async {
    final ResponseObject<PlaylistBaseModel> response = (await _apiService.call(
      const CreatePlaylistApiCall(),
      CreatePlaylistApiCallArgs(
          playlistName: playlistName,
          isPublic: isPublic,
          username: (await _userService.getUser()).userName),
    )) as ResponseObject<PlaylistBaseModel>;

    if (response.statusCode ~/ 100 == 2) {
      final PlaylistDetailedModel detailedModel =
          await _getDetailedModel(response.data!);
      _detailedPlaylists.add(detailedModel);
      _playlists.add(response.data!);
      return detailedModel;
    } else {
      return Future.error(response.error_code ?? 'UNKNOWN_ERROR');
    }
  }

  Future<PlaylistDetailedModel> addSongToPlaylist(
      String playlistId, int songId) async {
    final ResponseObject<PlaylistBaseModel> response = (await _apiService.call(
        const AddSongToPlaylistApiCall(),
        AddSongToPlaylistApiCallArgs(
          playlistId: playlistId,
          songId: songId,
        ))) as ResponseObject<PlaylistBaseModel>;

    if (response.statusCode ~/ 100 == 2) {
      final PlaylistDetailedModel detailedModel =
          await _getDetailedModel(response.data!);
      final int index = _detailedPlaylists.indexWhere(
          (PlaylistDetailedModel playlist) =>
              playlist.playlistId == playlistId);
      _detailedPlaylists[index] = detailedModel;
      _playlists[index] = response.data!;
      return detailedModel;
    } else {
      return Future.error(response.error_code ?? 'UNKNOWN_ERROR');
    }
  }

  Future<void> deletePlaylist(String playlistId) {
    final ResponseObject response = _apiService.call(
      const DeletePlaylistApiCall(),
      DeletePlaylistApiCallArguments(playlistId: playlistId),
    ) as ResponseObject;

    if (response.statusCode ~/ 100 == 2) {
      _detailedPlaylists.removeWhere((PlaylistDetailedModel playlist) =>
          playlist.playlistId == playlistId);
      _playlists.removeWhere(
          (PlaylistBaseModel playlist) => playlist.playlistId == playlistId);
      return Future.value();
    } else {
      return Future.error(response.error_code ?? 'UNKNOWN_ERROR');
    }
  }

  Future<void> removeSong(String playlistId, int songId) async {
    final ResponseObject response = await _apiService.call(
      const RemoveSongFromPlaylistApiCall(),
      RemoveSongFromPlaylistApiCallArgs(
        playlistId: playlistId,
        songId: songId,
      ),
    );

    if (response.statusCode ~/ 100 == 2) {
      final PlaylistDetailedModel detailedModel =
          await _getDetailedModel(response.data!);
      final int index = _detailedPlaylists.indexWhere(
          (PlaylistDetailedModel playlist) =>
              playlist.playlistId == playlistId);
      _detailedPlaylists[index] = detailedModel;
      _playlists[index] = response.data!;
      return Future.value();
    } else {
      return Future.error(response.error_code ?? 'UNKNOWN_ERROR');
    }
  }
}
