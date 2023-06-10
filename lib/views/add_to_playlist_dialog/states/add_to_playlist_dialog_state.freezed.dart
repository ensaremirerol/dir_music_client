// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_to_playlist_dialog_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddToPlaylistDialogState {
  List<PlaylistDetailedModel> get playlists =>
      throw _privateConstructorUsedError;
  int get songId => throw _privateConstructorUsedError;
  bool get isAdded => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddToPlaylistDialogStateCopyWith<AddToPlaylistDialogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddToPlaylistDialogStateCopyWith<$Res> {
  factory $AddToPlaylistDialogStateCopyWith(AddToPlaylistDialogState value,
          $Res Function(AddToPlaylistDialogState) then) =
      _$AddToPlaylistDialogStateCopyWithImpl<$Res, AddToPlaylistDialogState>;
  @useResult
  $Res call({List<PlaylistDetailedModel> playlists, int songId, bool isAdded});
}

/// @nodoc
class _$AddToPlaylistDialogStateCopyWithImpl<$Res,
        $Val extends AddToPlaylistDialogState>
    implements $AddToPlaylistDialogStateCopyWith<$Res> {
  _$AddToPlaylistDialogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playlists = null,
    Object? songId = null,
    Object? isAdded = null,
  }) {
    return _then(_value.copyWith(
      playlists: null == playlists
          ? _value.playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<PlaylistDetailedModel>,
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as int,
      isAdded: null == isAdded
          ? _value.isAdded
          : isAdded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddToPlaylistDialogStateCopyWith<$Res>
    implements $AddToPlaylistDialogStateCopyWith<$Res> {
  factory _$$_AddToPlaylistDialogStateCopyWith(
          _$_AddToPlaylistDialogState value,
          $Res Function(_$_AddToPlaylistDialogState) then) =
      __$$_AddToPlaylistDialogStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PlaylistDetailedModel> playlists, int songId, bool isAdded});
}

/// @nodoc
class __$$_AddToPlaylistDialogStateCopyWithImpl<$Res>
    extends _$AddToPlaylistDialogStateCopyWithImpl<$Res,
        _$_AddToPlaylistDialogState>
    implements _$$_AddToPlaylistDialogStateCopyWith<$Res> {
  __$$_AddToPlaylistDialogStateCopyWithImpl(_$_AddToPlaylistDialogState _value,
      $Res Function(_$_AddToPlaylistDialogState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playlists = null,
    Object? songId = null,
    Object? isAdded = null,
  }) {
    return _then(_$_AddToPlaylistDialogState(
      playlists: null == playlists
          ? _value._playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<PlaylistDetailedModel>,
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as int,
      isAdded: null == isAdded
          ? _value.isAdded
          : isAdded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AddToPlaylistDialogState implements _AddToPlaylistDialogState {
  _$_AddToPlaylistDialogState(
      {required final List<PlaylistDetailedModel> playlists,
      required this.songId,
      required this.isAdded})
      : _playlists = playlists;

  final List<PlaylistDetailedModel> _playlists;
  @override
  List<PlaylistDetailedModel> get playlists {
    if (_playlists is EqualUnmodifiableListView) return _playlists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlists);
  }

  @override
  final int songId;
  @override
  final bool isAdded;

  @override
  String toString() {
    return 'AddToPlaylistDialogState(playlists: $playlists, songId: $songId, isAdded: $isAdded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddToPlaylistDialogState &&
            const DeepCollectionEquality()
                .equals(other._playlists, _playlists) &&
            (identical(other.songId, songId) || other.songId == songId) &&
            (identical(other.isAdded, isAdded) || other.isAdded == isAdded));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_playlists), songId, isAdded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddToPlaylistDialogStateCopyWith<_$_AddToPlaylistDialogState>
      get copyWith => __$$_AddToPlaylistDialogStateCopyWithImpl<
          _$_AddToPlaylistDialogState>(this, _$identity);
}

abstract class _AddToPlaylistDialogState implements AddToPlaylistDialogState {
  factory _AddToPlaylistDialogState(
      {required final List<PlaylistDetailedModel> playlists,
      required final int songId,
      required final bool isAdded}) = _$_AddToPlaylistDialogState;

  @override
  List<PlaylistDetailedModel> get playlists;
  @override
  int get songId;
  @override
  bool get isAdded;
  @override
  @JsonKey(ignore: true)
  _$$_AddToPlaylistDialogStateCopyWith<_$_AddToPlaylistDialogState>
      get copyWith => throw _privateConstructorUsedError;
}
