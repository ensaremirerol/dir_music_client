import 'package:freezed_annotation/freezed_annotation.dart';

part 'position_state.freezed.dart';

@freezed
class PositionState with _$PositionState {
  factory PositionState({
    required Duration position,
    required Duration bufferedPosition,
    required Duration duration,
  }) = _PositionState;
}
