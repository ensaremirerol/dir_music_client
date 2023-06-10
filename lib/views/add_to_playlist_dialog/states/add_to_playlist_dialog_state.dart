import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/playlists/playlist_detailed_model/playlist_detailed_model.dart';

part 'add_to_playlist_dialog_state.freezed.dart';

@freezed
class AddToPlaylistDialogState with _$AddToPlaylistDialogState {
  factory AddToPlaylistDialogState({
    required List<PlaylistDetailedModel> playlists,
    required int songId,
    required bool isAdded,
  }) = _AddToPlaylistDialogState;
}
