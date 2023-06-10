import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/instance_controller.dart';
import '../../../models/playlists/playlist_detailed_model/playlist_detailed_model.dart';
import '../../../services/playlist_service/playlist_service.dart';

class PlaylistNotifier
    extends AutoDisposeFamilyAsyncNotifier<PlaylistDetailedModel, String> {
  final PlaylistService _playlistService =
      InstanceController().getByType<PlaylistService>();
  @override
  FutureOr<PlaylistDetailedModel> build(String arg) async {
    final playlist = await _playlistService.detailedPlaylists;
    return playlist.firstWhere((element) => element.playlistId == arg);
  }

  void removeSong(int id) async {
    await _playlistService.removeSong(state.requireValue.playlistId, id);
    state = AsyncValue.data((await _playlistService.detailedPlaylists)
        .firstWhere(
            (element) => element.playlistId == state.requireValue.playlistId));
  }
}
