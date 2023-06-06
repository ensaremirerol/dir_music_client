// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RefreshModel _$RefreshModelFromJson(Map<String, dynamic> json) {
  return _RefreshModel.fromJson(json);
}

/// @nodoc
mixin _$RefreshModel {
  String get accessToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefreshModelCopyWith<RefreshModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshModelCopyWith<$Res> {
  factory $RefreshModelCopyWith(
          RefreshModel value, $Res Function(RefreshModel) then) =
      _$RefreshModelCopyWithImpl<$Res, RefreshModel>;
  @useResult
  $Res call({String accessToken});
}

/// @nodoc
class _$RefreshModelCopyWithImpl<$Res, $Val extends RefreshModel>
    implements $RefreshModelCopyWith<$Res> {
  _$RefreshModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RefreshModelCopyWith<$Res>
    implements $RefreshModelCopyWith<$Res> {
  factory _$$_RefreshModelCopyWith(
          _$_RefreshModel value, $Res Function(_$_RefreshModel) then) =
      __$$_RefreshModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken});
}

/// @nodoc
class __$$_RefreshModelCopyWithImpl<$Res>
    extends _$RefreshModelCopyWithImpl<$Res, _$_RefreshModel>
    implements _$$_RefreshModelCopyWith<$Res> {
  __$$_RefreshModelCopyWithImpl(
      _$_RefreshModel _value, $Res Function(_$_RefreshModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
  }) {
    return _then(_$_RefreshModel(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RefreshModel implements _RefreshModel {
  _$_RefreshModel({required this.accessToken});

  factory _$_RefreshModel.fromJson(Map<String, dynamic> json) =>
      _$$_RefreshModelFromJson(json);

  @override
  final String accessToken;

  @override
  String toString() {
    return 'RefreshModel(accessToken: $accessToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RefreshModel &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RefreshModelCopyWith<_$_RefreshModel> get copyWith =>
      __$$_RefreshModelCopyWithImpl<_$_RefreshModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RefreshModelToJson(
      this,
    );
  }
}

abstract class _RefreshModel implements RefreshModel {
  factory _RefreshModel({required final String accessToken}) = _$_RefreshModel;

  factory _RefreshModel.fromJson(Map<String, dynamic> json) =
      _$_RefreshModel.fromJson;

  @override
  String get accessToken;
  @override
  @JsonKey(ignore: true)
  _$$_RefreshModelCopyWith<_$_RefreshModel> get copyWith =>
      throw _privateConstructorUsedError;
}
