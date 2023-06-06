// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginViewState {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginViewStateCopyWith<LoginViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginViewStateCopyWith<$Res> {
  factory $LoginViewStateCopyWith(
          LoginViewState value, $Res Function(LoginViewState) then) =
      _$LoginViewStateCopyWithImpl<$Res, LoginViewState>;
  @useResult
  $Res call({String username, String password, String error});
}

/// @nodoc
class _$LoginViewStateCopyWithImpl<$Res, $Val extends LoginViewState>
    implements $LoginViewStateCopyWith<$Res> {
  _$LoginViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? error = null,
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
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginViewStateCopyWith<$Res>
    implements $LoginViewStateCopyWith<$Res> {
  factory _$$_LoginViewStateCopyWith(
          _$_LoginViewState value, $Res Function(_$_LoginViewState) then) =
      __$$_LoginViewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password, String error});
}

/// @nodoc
class __$$_LoginViewStateCopyWithImpl<$Res>
    extends _$LoginViewStateCopyWithImpl<$Res, _$_LoginViewState>
    implements _$$_LoginViewStateCopyWith<$Res> {
  __$$_LoginViewStateCopyWithImpl(
      _$_LoginViewState _value, $Res Function(_$_LoginViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? error = null,
  }) {
    return _then(_$_LoginViewState(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginViewState implements _LoginViewState {
  _$_LoginViewState(
      {required this.username, required this.password, required this.error});

  @override
  final String username;
  @override
  final String password;
  @override
  final String error;

  @override
  String toString() {
    return 'LoginViewState(username: $username, password: $password, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginViewState &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, password, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginViewStateCopyWith<_$_LoginViewState> get copyWith =>
      __$$_LoginViewStateCopyWithImpl<_$_LoginViewState>(this, _$identity);
}

abstract class _LoginViewState implements LoginViewState {
  factory _LoginViewState(
      {required final String username,
      required final String password,
      required final String error}) = _$_LoginViewState;

  @override
  String get username;
  @override
  String get password;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$_LoginViewStateCopyWith<_$_LoginViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
