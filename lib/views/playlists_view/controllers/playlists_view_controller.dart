import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/instance_controller.dart';
import '../../../services/playlist_service/playlist_service.dart';
import '../states/playlists_view_state.dart';

class PlaylistsViewController extends AutoDisposeAsyncNotifier<PlaylistsViewState> {
  final PlaylistService _playlistService =
      InstanceController().getByType<PlaylistService>();

  @override
  FutureOr<PlaylistsViewState> build() async {
    final playlists = await _playlistService.getDetailedPlaylists();
    return PlaylistsViewState(playlists: playlists);
  }

  void createPlaylist(String playlistName, bool isPublic) async {
    state = const AsyncValue.loading();
    try {
      await _playlistService.createPlaylist(playlistName, isPublic);
      state = AsyncValue.data(PlaylistsViewState(
          playlists: await _playlistService.detailedPlaylists));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  void deletePlaylist(String playlistId) async {
    state = const AsyncValue.loading();
    try {
      await _playlistService.deletePlaylist(playlistId);
      state = AsyncValue.data(PlaylistsViewState(
          playlists: await _playlistService.detailedPlaylists));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
