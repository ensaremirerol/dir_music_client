// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'position_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PositionState {
  Duration get position => throw _privateConstructorUsedError;
  Duration get bufferedPosition => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PositionStateCopyWith<PositionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionStateCopyWith<$Res> {
  factory $PositionStateCopyWith(
          PositionState value, $Res Function(PositionState) then) =
      _$PositionStateCopyWithImpl<$Res, PositionState>;
  @useResult
  $Res call({Duration position, Duration bufferedPosition, Duration duration});
}

/// @nodoc
class _$PositionStateCopyWithImpl<$Res, $Val extends PositionState>
    implements $PositionStateCopyWith<$Res> {
  _$PositionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? bufferedPosition = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      bufferedPosition: null == bufferedPosition
          ? _value.bufferedPosition
          : bufferedPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PositionStateCopyWith<$Res>
    implements $PositionStateCopyWith<$Res> {
  factory _$$_PositionStateCopyWith(
          _$_PositionState value, $Res Function(_$_PositionState) then) =
      __$$_PositionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration position, Duration bufferedPosition, Duration duration});
}

/// @nodoc
class __$$_PositionStateCopyWithImpl<$Res>
    extends _$PositionStateCopyWithImpl<$Res, _$_PositionState>
    implements _$$_PositionStateCopyWith<$Res> {
  __$$_PositionStateCopyWithImpl(
      _$_PositionState _value, $Res Function(_$_PositionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? bufferedPosition = null,
    Object? duration = null,
  }) {
    return _then(_$_PositionState(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      bufferedPosition: null == bufferedPosition
          ? _value.bufferedPosition
          : bufferedPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$_PositionState implements _PositionState {
  _$_PositionState(
      {required this.position,
      required this.bufferedPosition,
      required this.duration});

  @override
  final Duration position;
  @override
  final Duration bufferedPosition;
  @override
  final Duration duration;

  @override
  String toString() {
    return 'PositionState(position: $position, bufferedPosition: $bufferedPosition, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PositionState &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.bufferedPosition, bufferedPosition) ||
                other.bufferedPosition == bufferedPosition) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, position, bufferedPosition, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PositionStateCopyWith<_$_PositionState> get copyWith =>
      __$$_PositionStateCopyWithImpl<_$_PositionState>(this, _$identity);
}

abstract class _PositionState implements PositionState {
  factory _PositionState(
      {required final Duration position,
      required final Duration bufferedPosition,
      required final Duration duration}) = _$_PositionState;

  @override
  Duration get position;
  @override
  Duration get bufferedPosition;
  @override
  Duration get duration;
  @override
  @JsonKey(ignore: true)
  _$$_PositionStateCopyWith<_$_PositionState> get copyWith =>
      throw _privateConstructorUsedError;
}
