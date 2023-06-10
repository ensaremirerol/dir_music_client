import 'package:freezed_annotation/freezed_annotation.dart';

import '../../metadata/metadata_model.dart';

part 'playlist_detailed_model.freezed.dart';
part 'playlist_detailed_model.g.dart';

@freezed
class PlaylistDetailedModel with _$PlaylistDetailedModel {
  factory PlaylistDetailedModel({
    required String playlistId,
    required String playlistName,
    required int userId,
    required String userName,
    required bool public,
    required List<MetadataModel> songs,
  }) = _PlaylistDetailedModel;

  factory PlaylistDetailedModel.fromJson(Map<String, dynamic> json) =>
      _$PlaylistDetailedModelFromJson(json);
}
