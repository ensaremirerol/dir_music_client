// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist_detailed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaylistDetailedModel _$PlaylistDetailedModelFromJson(
    Map<String, dynamic> json) {
  return _PlaylistDetailedModel.fromJson(json);
}

/// @nodoc
mixin _$PlaylistDetailedModel {
  String get playlistId => throw _privateConstructorUsedError;
  String get playlistName => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  bool get public => throw _privateConstructorUsedError;
  List<MetadataModel> get songs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaylistDetailedModelCopyWith<PlaylistDetailedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistDetailedModelCopyWith<$Res> {
  factory $PlaylistDetailedModelCopyWith(PlaylistDetailedModel value,
          $Res Function(PlaylistDetailedModel) then) =
      _$PlaylistDetailedModelCopyWithImpl<$Res, PlaylistDetailedModel>;
  @useResult
  $Res call(
      {String playlistId,
      String playlistName,
      int userId,
      String userName,
      bool public,
      List<MetadataModel> songs});
}

/// @nodoc
class _$PlaylistDetailedModelCopyWithImpl<$Res,
        $Val extends PlaylistDetailedModel>
    implements $PlaylistDetailedModelCopyWith<$Res> {
  _$PlaylistDetailedModelCopyWithImpl(this._value, this._then);

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
    Object? songs = null,
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
      songs: null == songs
          ? _value.songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<MetadataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlaylistDetailedModelCopyWith<$Res>
    implements $PlaylistDetailedModelCopyWith<$Res> {
  factory _$$_PlaylistDetailedModelCopyWith(_$_PlaylistDetailedModel value,
          $Res Function(_$_PlaylistDetailedModel) then) =
      __$$_PlaylistDetailedModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String playlistId,
      String playlistName,
      int userId,
      String userName,
      bool public,
      List<MetadataModel> songs});
}

/// @nodoc
class __$$_PlaylistDetailedModelCopyWithImpl<$Res>
    extends _$PlaylistDetailedModelCopyWithImpl<$Res, _$_PlaylistDetailedModel>
    implements _$$_PlaylistDetailedModelCopyWith<$Res> {
  __$$_PlaylistDetailedModelCopyWithImpl(_$_PlaylistDetailedModel _value,
      $Res Function(_$_PlaylistDetailedModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playlistId = null,
    Object? playlistName = null,
    Object? userId = null,
    Object? userName = null,
    Object? public = null,
    Object? songs = null,
  }) {
    return _then(_$_PlaylistDetailedModel(
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
      songs: null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<MetadataModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlaylistDetailedModel implements _PlaylistDetailedModel {
  _$_PlaylistDetailedModel(
      {required this.playlistId,
      required this.playlistName,
      required this.userId,
      required this.userName,
      required this.public,
      required final List<MetadataModel> songs})
      : _songs = songs;

  factory _$_PlaylistDetailedModel.fromJson(Map<String, dynamic> json) =>
      _$$_PlaylistDetailedModelFromJson(json);

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
  final List<MetadataModel> _songs;
  @override
  List<MetadataModel> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  @override
  String toString() {
    return 'PlaylistDetailedModel(playlistId: $playlistId, playlistName: $playlistName, userId: $userId, userName: $userName, public: $public, songs: $songs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaylistDetailedModel &&
            (identical(other.playlistId, playlistId) ||
                other.playlistId == playlistId) &&
            (identical(other.playlistName, playlistName) ||
                other.playlistName == playlistName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.public, public) || other.public == public) &&
            const DeepCollectionEquality().equals(other._songs, _songs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, playlistId, playlistName, userId,
      userName, public, const DeepCollectionEquality().hash(_songs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaylistDetailedModelCopyWith<_$_PlaylistDetailedModel> get copyWith =>
      __$$_PlaylistDetailedModelCopyWithImpl<_$_PlaylistDetailedModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaylistDetailedModelToJson(
      this,
    );
  }
}

abstract class _PlaylistDetailedModel implements PlaylistDetailedModel {
  factory _PlaylistDetailedModel(
      {required final String playlistId,
      required final String playlistName,
      required final int userId,
      required final String userName,
      required final bool public,
      required final List<MetadataModel> songs}) = _$_PlaylistDetailedModel;

  factory _PlaylistDetailedModel.fromJson(Map<String, dynamic> json) =
      _$_PlaylistDetailedModel.fromJson;

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
  List<MetadataModel> get songs;
  @override
  @JsonKey(ignore: true)
  _$$_PlaylistDetailedModelCopyWith<_$_PlaylistDetailedModel> get copyWith =>
      throw _privateConstructorUsedError;
}
