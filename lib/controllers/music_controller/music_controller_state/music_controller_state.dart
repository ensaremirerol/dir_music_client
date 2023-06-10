import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/metadata/metadata_model.dart';

part 'music_controller_state.freezed.dart';

@freezed
class MusicControllerState with _$MusicControllerState {
  factory MusicControllerState({
    required MetadataModel? currentSong,
    required List<MetadataModel>? playlist,
    required bool isPlaying,
    required Duration position,
    required Duration bufferedPosition,
    required Duration duration,
    required bool nextSongAvailable,
    required bool previousSongAvailable,
    required int? currentIndex,
  }) = _MusicControllerState;
}
