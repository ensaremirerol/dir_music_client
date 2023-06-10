import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/playlists/playlist_detailed_model/playlist_detailed_model.dart';

part 'playlists_view_state.freezed.dart';

@freezed
class PlaylistsViewState with _$PlaylistsViewState {
  factory PlaylistsViewState({
    required List<PlaylistDetailedModel> playlists,
  }) = _PlaylistsViewState;
}
