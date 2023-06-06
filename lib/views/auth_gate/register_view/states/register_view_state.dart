import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_view_state.freezed.dart';

@freezed
class RegisterViewState with _$RegisterViewState {
  factory RegisterViewState({
    required String username,
    required String password,
    required DateTime? birthDate,
    required String phoneNumber,
    required String message,
  }) = _RegisterViewState;
}
