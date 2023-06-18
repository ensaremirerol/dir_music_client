import 'package:freezed_annotation/freezed_annotation.dart';

part 'byte_stream_model.freezed.dart';

@freezed
class ByteStreamModel with _$ByteStreamModel {
  factory ByteStreamModel({
    required List<int> bytes,
    required int contentLength,
  }) = _ByteStreamModel;
}
