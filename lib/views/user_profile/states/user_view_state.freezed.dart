// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserViewState {
  String get userName => throw _privateConstructorUsedError;
  String? get followerCount => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  bool get includePrivateInformation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserViewStateCopyWith<UserViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserViewStateCopyWith<$Res> {
  factory $UserViewStateCopyWith(
          UserViewState value, $Res Function(UserViewState) then) =
      _$UserViewStateCopyWithImpl<$Res, UserViewState>;
  @useResult
  $Res call(
      {String userName,
      String? followerCount,
      String? phoneNumber,
      DateTime? dateOfBirth,
      bool includePrivateInformation});
}

/// @nodoc
class _$UserViewStateCopyWithImpl<$Res, $Val extends UserViewState>
    implements $UserViewStateCopyWith<$Res> {
  _$UserViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? followerCount = freezed,
    Object? phoneNumber = freezed,
    Object? dateOfBirth = freezed,
    Object? includePrivateInformation = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      followerCount: freezed == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      includePrivateInformation: null == includePrivateInformation
          ? _value.includePrivateInformation
          : includePrivateInformation // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserViewStateCopyWith<$Res>
    implements $UserViewStateCopyWith<$Res> {
  factory _$$_UserViewStateCopyWith(
          _$_UserViewState value, $Res Function(_$_UserViewState) then) =
      __$$_UserViewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName,
      String? followerCount,
      String? phoneNumber,
      DateTime? dateOfBirth,
      bool includePrivateInformation});
}

/// @nodoc
class __$$_UserViewStateCopyWithImpl<$Res>
    extends _$UserViewStateCopyWithImpl<$Res, _$_UserViewState>
    implements _$$_UserViewStateCopyWith<$Res> {
  __$$_UserViewStateCopyWithImpl(
      _$_UserViewState _value, $Res Function(_$_UserViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? followerCount = freezed,
    Object? phoneNumber = freezed,
    Object? dateOfBirth = freezed,
    Object? includePrivateInformation = null,
  }) {
    return _then(_$_UserViewState(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      followerCount: freezed == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      includePrivateInformation: null == includePrivateInformation
          ? _value.includePrivateInformation
          : includePrivateInformation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UserViewState implements _UserViewState {
  _$_UserViewState(
      {required this.userName,
      required this.followerCount,
      required this.phoneNumber,
      required this.dateOfBirth,
      required this.includePrivateInformation});

  @override
  final String userName;
  @override
  final String? followerCount;
  @override
  final String? phoneNumber;
  @override
  final DateTime? dateOfBirth;
  @override
  final bool includePrivateInformation;

  @override
  String toString() {
    return 'UserViewState(userName: $userName, followerCount: $followerCount, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, includePrivateInformation: $includePrivateInformation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserViewState &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.includePrivateInformation,
                    includePrivateInformation) ||
                other.includePrivateInformation == includePrivateInformation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, followerCount,
      phoneNumber, dateOfBirth, includePrivateInformation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserViewStateCopyWith<_$_UserViewState> get copyWith =>
      __$$_UserViewStateCopyWithImpl<_$_UserViewState>(this, _$identity);
}

abstract class _UserViewState implements UserViewState {
  factory _UserViewState(
      {required final String userName,
      required final String? followerCount,
      required final String? phoneNumber,
      required final DateTime? dateOfBirth,
      required final bool includePrivateInformation}) = _$_UserViewState;

  @override
  String get userName;
  @override
  String? get followerCount;
  @override
  String? get phoneNumber;
  @override
  DateTime? get dateOfBirth;
  @override
  bool get includePrivateInformation;
  @override
  @JsonKey(ignore: true)
  _$$_UserViewStateCopyWith<_$_UserViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
