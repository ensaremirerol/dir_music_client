import 'package:freezed_annotation/freezed_annotation.dart';

part 'playlist_base_model.freezed.dart';
part 'playlist_base_model.g.dart';

/*
private String playlistId;
    private String playlistName;
    private Long userId;
    private String userName;
    private boolean public;
    private List<Long> songIds;

*/

@freezed
class PlaylistBaseModel with _$PlaylistBaseModel {
  factory PlaylistBaseModel({
    required String playlistId,
    required String playlistName,
    required int userId,
    required String userName,
    required bool public,
    required List<int> songIds,
  }) = _PlaylistBaseModel;

  factory PlaylistBaseModel.fromJson(Map<String, dynamic> json) =>
      _$PlaylistBaseModelFromJson(json);
}
