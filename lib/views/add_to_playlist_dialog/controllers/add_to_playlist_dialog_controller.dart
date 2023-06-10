import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/instance_controller.dart';
import '../../../services/playlist_service/playlist_service.dart';
import '../states/add_to_playlist_dialog_state.dart';

class AddToPlaylistDialogController
    extends AutoDisposeFamilyAsyncNotifier<AddToPlaylistDialogState, int> {
  final PlaylistService _playlistService =
      InstanceController().getByType<PlaylistService>();

  @override
  FutureOr<AddToPlaylistDialogState> build(int arg) async {
    final playlists = await _playlistService.getDetailedPlaylists();
    return AddToPlaylistDialogState(
        playlists: playlists, songId: arg, isAdded: false);
  }

  Future<String> addSongToPlaylist(String playlistId) async {
    state = const AsyncValue.loading();
    try {
      await _playlistService.addSongToPlaylist(
          playlistId, state.requireValue.songId);
      state = AsyncValue.data(AddToPlaylistDialogState(
          playlists: await _playlistService.detailedPlaylists,
          songId: state.requireValue.songId,
          isAdded: true));
      return 'song_added_to_playlist';
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return 'error_adding_song_to_playlist';
    }
  }
}
