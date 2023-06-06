// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_controller_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MusicControllerState {
  MetadataModel? get currentSong => throw _privateConstructorUsedError;
  List<MetadataModel>? get playlist => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;
  Duration get position => throw _privateConstructorUsedError;
  Duration get bufferedPosition => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  bool get nextSongAvailable => throw _privateConstructorUsedError;
  bool get previousSongAvailable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MusicControllerStateCopyWith<MusicControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicControllerStateCopyWith<$Res> {
  factory $MusicControllerStateCopyWith(MusicControllerState value,
          $Res Function(MusicControllerState) then) =
      _$MusicControllerStateCopyWithImpl<$Res, MusicControllerState>;
  @useResult
  $Res call(
      {MetadataModel? currentSong,
      List<MetadataModel>? playlist,
      bool isPlaying,
      Duration position,
      Duration bufferedPosition,
      Duration duration,
      bool nextSongAvailable,
      bool previousSongAvailable});

  $MetadataModelCopyWith<$Res>? get currentSong;
}

/// @nodoc
class _$MusicControllerStateCopyWithImpl<$Res,
        $Val extends MusicControllerState>
    implements $MusicControllerStateCopyWith<$Res> {
  _$MusicControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentSong = freezed,
    Object? playlist = freezed,
    Object? isPlaying = null,
    Object? position = null,
    Object? bufferedPosition = null,
    Object? duration = null,
    Object? nextSongAvailable = null,
    Object? previousSongAvailable = null,
  }) {
    return _then(_value.copyWith(
      currentSong: freezed == currentSong
          ? _value.currentSong
          : currentSong // ignore: cast_nullable_to_non_nullable
              as MetadataModel?,
      playlist: freezed == playlist
          ? _value.playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as List<MetadataModel>?,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
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
      nextSongAvailable: null == nextSongAvailable
          ? _value.nextSongAvailable
          : nextSongAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      previousSongAvailable: null == previousSongAvailable
          ? _value.previousSongAvailable
          : previousSongAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetadataModelCopyWith<$Res>? get currentSong {
    if (_value.currentSong == null) {
      return null;
    }

    return $MetadataModelCopyWith<$Res>(_value.currentSong!, (value) {
      return _then(_value.copyWith(currentSong: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MusicControllerStateCopyWith<$Res>
    implements $MusicControllerStateCopyWith<$Res> {
  factory _$$_MusicControllerStateCopyWith(_$_MusicControllerState value,
          $Res Function(_$_MusicControllerState) then) =
      __$$_MusicControllerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MetadataModel? currentSong,
      List<MetadataModel>? playlist,
      bool isPlaying,
      Duration position,
      Duration bufferedPosition,
      Duration duration,
      bool nextSongAvailable,
      bool previousSongAvailable});

  @override
  $MetadataModelCopyWith<$Res>? get currentSong;
}

/// @nodoc
class __$$_MusicControllerStateCopyWithImpl<$Res>
    extends _$MusicControllerStateCopyWithImpl<$Res, _$_MusicControllerState>
    implements _$$_MusicControllerStateCopyWith<$Res> {
  __$$_MusicControllerStateCopyWithImpl(_$_MusicControllerState _value,
      $Res Function(_$_MusicControllerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentSong = freezed,
    Object? playlist = freezed,
    Object? isPlaying = null,
    Object? position = null,
    Object? bufferedPosition = null,
    Object? duration = null,
    Object? nextSongAvailable = null,
    Object? previousSongAvailable = null,
  }) {
    return _then(_$_MusicControllerState(
      currentSong: freezed == currentSong
          ? _value.currentSong
          : currentSong // ignore: cast_nullable_to_non_nullable
              as MetadataModel?,
      playlist: freezed == playlist
          ? _value._playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as List<MetadataModel>?,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
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
      nextSongAvailable: null == nextSongAvailable
          ? _value.nextSongAvailable
          : nextSongAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      previousSongAvailable: null == previousSongAvailable
          ? _value.previousSongAvailable
          : previousSongAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MusicControllerState implements _MusicControllerState {
  _$_MusicControllerState(
      {required this.currentSong,
      required final List<MetadataModel>? playlist,
      required this.isPlaying,
      required this.position,
      required this.bufferedPosition,
      required this.duration,
      required this.nextSongAvailable,
      required this.previousSongAvailable})
      : _playlist = playlist;

  @override
  final MetadataModel? currentSong;
  final List<MetadataModel>? _playlist;
  @override
  List<MetadataModel>? get playlist {
    final value = _playlist;
    if (value == null) return null;
    if (_playlist is EqualUnmodifiableListView) return _playlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool isPlaying;
  @override
  final Duration position;
  @override
  final Duration bufferedPosition;
  @override
  final Duration duration;
  @override
  final bool nextSongAvailable;
  @override
  final bool previousSongAvailable;

  @override
  String toString() {
    return 'MusicControllerState(currentSong: $currentSong, playlist: $playlist, isPlaying: $isPlaying, position: $position, bufferedPosition: $bufferedPosition, duration: $duration, nextSongAvailable: $nextSongAvailable, previousSongAvailable: $previousSongAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MusicControllerState &&
            (identical(other.currentSong, currentSong) ||
                other.currentSong == currentSong) &&
            const DeepCollectionEquality().equals(other._playlist, _playlist) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.bufferedPosition, bufferedPosition) ||
                other.bufferedPosition == bufferedPosition) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.nextSongAvailable, nextSongAvailable) ||
                other.nextSongAvailable == nextSongAvailable) &&
            (identical(other.previousSongAvailable, previousSongAvailable) ||
                other.previousSongAvailable == previousSongAvailable));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentSong,
      const DeepCollectionEquality().hash(_playlist),
      isPlaying,
      position,
      bufferedPosition,
      duration,
      nextSongAvailable,
      previousSongAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MusicControllerStateCopyWith<_$_MusicControllerState> get copyWith =>
      __$$_MusicControllerStateCopyWithImpl<_$_MusicControllerState>(
          this, _$identity);
}

abstract class _MusicControllerState implements MusicControllerState {
  factory _MusicControllerState(
      {required final MetadataModel? currentSong,
      required final List<MetadataModel>? playlist,
      required final bool isPlaying,
      required final Duration position,
      required final Duration bufferedPosition,
      required final Duration duration,
      required final bool nextSongAvailable,
      required final bool previousSongAvailable}) = _$_MusicControllerState;

  @override
  MetadataModel? get currentSong;
  @override
  List<MetadataModel>? get playlist;
  @override
  bool get isPlaying;
  @override
  Duration get position;
  @override
  Duration get bufferedPosition;
  @override
  Duration get duration;
  @override
  bool get nextSongAvailable;
  @override
  bool get previousSongAvailable;
  @override
  @JsonKey(ignore: true)
  _$$_MusicControllerStateCopyWith<_$_MusicControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}
