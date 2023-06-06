import 'package:freezed_annotation/freezed_annotation.dart';

part 'metadata_model.freezed.dart';
part 'metadata_model.g.dart';

@freezed
class MetadataModel with _$MetadataModel {
  factory MetadataModel({
    required int id,
    required String title,
    required String artist,
    required String album,
    required String genre,
    required String? year,
    required String? track,
    required int? durationMillis,
    required int? sizeBytes,
    required bool listenable,
  }) = _MetadataModel;

  factory MetadataModel.fromJson(Map<String, dynamic> json) =>
      _$MetadataModelFromJson(json);
}
