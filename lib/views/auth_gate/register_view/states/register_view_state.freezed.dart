// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterViewState {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  DateTime? get birthDate => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterViewStateCopyWith<RegisterViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterViewStateCopyWith<$Res> {
  factory $RegisterViewStateCopyWith(
          RegisterViewState value, $Res Function(RegisterViewState) then) =
      _$RegisterViewStateCopyWithImpl<$Res, RegisterViewState>;
  @useResult
  $Res call(
      {String username,
      String password,
      DateTime? birthDate,
      String phoneNumber,
      String message});
}

/// @nodoc
class _$RegisterViewStateCopyWithImpl<$Res, $Val extends RegisterViewState>
    implements $RegisterViewStateCopyWith<$Res> {
  _$RegisterViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? birthDate = freezed,
    Object? phoneNumber = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterViewStateCopyWith<$Res>
    implements $RegisterViewStateCopyWith<$Res> {
  factory _$$_RegisterViewStateCopyWith(_$_RegisterViewState value,
          $Res Function(_$_RegisterViewState) then) =
      __$$_RegisterViewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String password,
      DateTime? birthDate,
      String phoneNumber,
      String message});
}

/// @nodoc
class __$$_RegisterViewStateCopyWithImpl<$Res>
    extends _$RegisterViewStateCopyWithImpl<$Res, _$_RegisterViewState>
    implements _$$_RegisterViewStateCopyWith<$Res> {
  __$$_RegisterViewStateCopyWithImpl(
      _$_RegisterViewState _value, $Res Function(_$_RegisterViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? birthDate = freezed,
    Object? phoneNumber = null,
    Object? message = null,
  }) {
    return _then(_$_RegisterViewState(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegisterViewState implements _RegisterViewState {
  _$_RegisterViewState(
      {required this.username,
      required this.password,
      required this.birthDate,
      required this.phoneNumber,
      required this.message});

  @override
  final String username;
  @override
  final String password;
  @override
  final DateTime? birthDate;
  @override
  final String phoneNumber;
  @override
  final String message;

  @override
  String toString() {
    return 'RegisterViewState(username: $username, password: $password, birthDate: $birthDate, phoneNumber: $phoneNumber, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterViewState &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, username, password, birthDate, phoneNumber, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterViewStateCopyWith<_$_RegisterViewState> get copyWith =>
      __$$_RegisterViewStateCopyWithImpl<_$_RegisterViewState>(
          this, _$identity);
}

abstract class _RegisterViewState implements RegisterViewState {
  factory _RegisterViewState(
      {required final String username,
      required final String password,
      required final DateTime? birthDate,
      required final String phoneNumber,
      required final String message}) = _$_RegisterViewState;

  @override
  String get username;
  @override
  String get password;
  @override
  DateTime? get birthDate;
  @override
  String get phoneNumber;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterViewStateCopyWith<_$_RegisterViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
