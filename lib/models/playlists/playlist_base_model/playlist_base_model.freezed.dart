// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist_base_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaylistBaseModel _$PlaylistBaseModelFromJson(Map<String, dynamic> json) {
  return _PlaylistBaseModel.fromJson(json);
}

/// @nodoc
mixin _$PlaylistBaseModel {
  String get playlistId => throw _privateConstructorUsedError;
  String get playlistName => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  bool get public => throw _privateConstructorUsedError;
  List<int> get songIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaylistBaseModelCopyWith<PlaylistBaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistBaseModelCopyWith<$Res> {
  factory $PlaylistBaseModelCopyWith(
          PlaylistBaseModel value, $Res Function(PlaylistBaseModel) then) =
      _$PlaylistBaseModelCopyWithImpl<$Res, PlaylistBaseModel>;
  @useResult
  $Res call(
      {String playlistId,
      String playlistName,
      int userId,
      String userName,
      bool public,
      List<int> songIds});
}

/// @nodoc
class _$PlaylistBaseModelCopyWithImpl<$Res, $Val extends PlaylistBaseModel>
    implements $PlaylistBaseModelCopyWith<$Res> {
  _$PlaylistBaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playlistId = null,
    Object? playlistName = null,
    Object? userId = null,
    Object? userName = null,
    Object? public = null,
    Object? songIds = null,
  }) {
    return _then(_value.copyWith(
      playlistId: null == playlistId
          ? _value.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String,
      playlistName: null == playlistName
          ? _value.playlistName
          : playlistName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      public: null == public
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as bool,
      songIds: null == songIds
          ? _value.songIds
          : songIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlaylistBaseModelCopyWith<$Res>
    implements $PlaylistBaseModelCopyWith<$Res> {
  factory _$$_PlaylistBaseModelCopyWith(_$_PlaylistBaseModel value,
          $Res Function(_$_PlaylistBaseModel) then) =
      __$$_PlaylistBaseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String playlistId,
      String playlistName,
      int userId,
      String userName,
      bool public,
      List<int> songIds});
}

/// @nodoc
class __$$_PlaylistBaseModelCopyWithImpl<$Res>
    extends _$PlaylistBaseModelCopyWithImpl<$Res, _$_PlaylistBaseModel>
    implements _$$_PlaylistBaseModelCopyWith<$Res> {
  __$$_PlaylistBaseModelCopyWithImpl(
      _$_PlaylistBaseModel _value, $Res Function(_$_PlaylistBaseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playlistId = null,
    Object? playlistName = null,
    Object? userId = null,
    Object? userName = null,
    Object? public = null,
    Object? songIds = null,
  }) {
    return _then(_$_PlaylistBaseModel(
      playlistId: null == playlistId
          ? _value.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String,
      playlistName: null == playlistName
          ? _value.playlistName
          : playlistName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      public: null == public
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as bool,
      songIds: null == songIds
          ? _value._songIds
          : songIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlaylistBaseModel implements _PlaylistBaseModel {
  _$_PlaylistBaseModel(
      {required this.playlistId,
      required this.playlistName,
      required this.userId,
      required this.userName,
      required this.public,
      required final List<int> songIds})
      : _songIds = songIds;

  factory _$_PlaylistBaseModel.fromJson(Map<String, dynamic> json) =>
      _$$_PlaylistBaseModelFromJson(json);

  @override
  final String playlistId;
  @override
  final String playlistName;
  @override
  final int userId;
  @override
  final String userName;
  @override
  final bool public;
  final List<int> _songIds;
  @override
  List<int> get songIds {
    if (_songIds is EqualUnmodifiableListView) return _songIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songIds);
  }

  @override
  String toString() {
    return 'PlaylistBaseModel(playlistId: $playlistId, playlistName: $playlistName, userId: $userId, userName: $userName, public: $public, songIds: $songIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaylistBaseModel &&
            (identical(other.playlistId, playlistId) ||
                other.playlistId == playlistId) &&
            (identical(other.playlistName, playlistName) ||
                other.playlistName == playlistName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.public, public) || other.public == public) &&
            const DeepCollectionEquality().equals(other._songIds, _songIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, playlistId, playlistName, userId,
      userName, public, const DeepCollectionEquality().hash(_songIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaylistBaseModelCopyWith<_$_PlaylistBaseModel> get copyWith =>
      __$$_PlaylistBaseModelCopyWithImpl<_$_PlaylistBaseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaylistBaseModelToJson(
      this,
    );
  }
}

abstract class _PlaylistBaseModel implements PlaylistBaseModel {
  factory _PlaylistBaseModel(
      {required final String playlistId,
      required final String playlistName,
      required final int userId,
      required final String userName,
      required final bool public,
      required final List<int> songIds}) = _$_PlaylistBaseModel;

  factory _PlaylistBaseModel.fromJson(Map<String, dynamic> json) =
      _$_PlaylistBaseModel.fromJson;

  @override
  String get playlistId;
  @override
  String get playlistName;
  @override
  int get userId;
  @override
  String get userName;
  @override
  bool get public;
  @override
  List<int> get songIds;
  @override
  @JsonKey(ignore: true)
  _$$_PlaylistBaseModelCopyWith<_$_PlaylistBaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
