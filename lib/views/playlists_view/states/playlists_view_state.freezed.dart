// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlists_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaylistsViewState {
  List<PlaylistDetailedModel> get playlists =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaylistsViewStateCopyWith<PlaylistsViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistsViewStateCopyWith<$Res> {
  factory $PlaylistsViewStateCopyWith(
          PlaylistsViewState value, $Res Function(PlaylistsViewState) then) =
      _$PlaylistsViewStateCopyWithImpl<$Res, PlaylistsViewState>;
  @useResult
  $Res call({List<PlaylistDetailedModel> playlists});
}

/// @nodoc
class _$PlaylistsViewStateCopyWithImpl<$Res, $Val extends PlaylistsViewState>
    implements $PlaylistsViewStateCopyWith<$Res> {
  _$PlaylistsViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playlists = null,
  }) {
    return _then(_value.copyWith(
      playlists: null == playlists
          ? _value.playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<PlaylistDetailedModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlaylistsViewStateCopyWith<$Res>
    implements $PlaylistsViewStateCopyWith<$Res> {
  factory _$$_PlaylistsViewStateCopyWith(_$_PlaylistsViewState value,
          $Res Function(_$_PlaylistsViewState) then) =
      __$$_PlaylistsViewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PlaylistDetailedModel> playlists});
}

/// @nodoc
class __$$_PlaylistsViewStateCopyWithImpl<$Res>
    extends _$PlaylistsViewStateCopyWithImpl<$Res, _$_PlaylistsViewState>
    implements _$$_PlaylistsViewStateCopyWith<$Res> {
  __$$_PlaylistsViewStateCopyWithImpl(
      _$_PlaylistsViewState _value, $Res Function(_$_PlaylistsViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playlists = null,
  }) {
    return _then(_$_PlaylistsViewState(
      playlists: null == playlists
          ? _value._playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<PlaylistDetailedModel>,
    ));
  }
}

/// @nodoc

class _$_PlaylistsViewState implements _PlaylistsViewState {
  _$_PlaylistsViewState({required final List<PlaylistDetailedModel> playlists})
      : _playlists = playlists;

  final List<PlaylistDetailedModel> _playlists;
  @override
  List<PlaylistDetailedModel> get playlists {
    if (_playlists is EqualUnmodifiableListView) return _playlists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlists);
  }

  @override
  String toString() {
    return 'PlaylistsViewState(playlists: $playlists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaylistsViewState &&
            const DeepCollectionEquality()
                .equals(other._playlists, _playlists));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_playlists));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaylistsViewStateCopyWith<_$_PlaylistsViewState> get copyWith =>
      __$$_PlaylistsViewStateCopyWithImpl<_$_PlaylistsViewState>(
          this, _$identity);
}

abstract class _PlaylistsViewState implements PlaylistsViewState {
  factory _PlaylistsViewState(
          {required final List<PlaylistDetailedModel> playlists}) =
      _$_PlaylistsViewState;

  @override
  List<PlaylistDetailedModel> get playlists;
  @override
  @JsonKey(ignore: true)
  _$$_PlaylistsViewStateCopyWith<_$_PlaylistsViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
