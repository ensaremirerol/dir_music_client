import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_view_state.freezed.dart';

@freezed
class LoginViewState with _$LoginViewState {
  factory LoginViewState({
    required String username,
    required String password,
    required String error,
  }) = _LoginViewState;
}
