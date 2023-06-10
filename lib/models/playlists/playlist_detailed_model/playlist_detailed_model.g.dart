// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_detailed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlaylistDetailedModel _$$_PlaylistDetailedModelFromJson(
        Map<String, dynamic> json) =>
    _$_PlaylistDetailedModel(
      playlistId: json['playlistId'] as String,
      playlistName: json['playlistName'] as String,
      userId: json['userId'] as int,
      userName: json['userName'] as String,
      public: json['public'] as bool,
      songs: (json['songs'] as List<dynamic>)
          .map((e) => MetadataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PlaylistDetailedModelToJson(
        _$_PlaylistDetailedModel instance) =>
    <String, dynamic>{
      'playlistId': instance.playlistId,
      'playlistName': instance.playlistName,
      'userId': instance.userId,
      'userName': instance.userName,
      'public': instance.public,
      'songs': instance.songs,
    };
