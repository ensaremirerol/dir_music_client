// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MetadataModel _$$_MetadataModelFromJson(Map<String, dynamic> json) =>
    _$_MetadataModel(
      id: json['id'] as int,
      title: json['title'] as String,
      artist: json['artist'] as String,
      album: json['album'] as String,
      genre: json['genre'] as String,
      year: json['year'] as String?,
      track: json['track'] as String?,
      durationMillis: json['durationMillis'] as int?,
      sizeBytes: json['sizeBytes'] as int?,
      listenable: json['listenable'] as bool,
    );

Map<String, dynamic> _$$_MetadataModelToJson(_$_MetadataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artist': instance.artist,
      'album': instance.album,
      'genre': instance.genre,
      'year': instance.year,
      'track': instance.track,
      'durationMillis': instance.durationMillis,
      'sizeBytes': instance.sizeBytes,
      'listenable': instance.listenable,
    };
