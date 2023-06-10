// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlaylistBaseModel _$$_PlaylistBaseModelFromJson(Map<String, dynamic> json) =>
    _$_PlaylistBaseModel(
      playlistId: json['playlistId'] as String,
      playlistName: json['playlistName'] as String,
      userId: json['userId'] as int,
      userName: json['userName'] as String,
      public: json['public'] as bool,
      songIds: (json['songIds'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_PlaylistBaseModelToJson(
        _$_PlaylistBaseModel instance) =>
    <String, dynamic>{
      'playlistId': instance.playlistId,
      'playlistName': instance.playlistName,
      'userId': instance.userId,
      'userName': instance.userName,
      'public': instance.public,
      'songIds': instance.songIds,
    };
