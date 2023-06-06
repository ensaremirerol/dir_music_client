import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/instance_controller.dart';
import '../../../../services/auth_service/auth_service.dart';
import '../states/register_view_state.dart';

class RegisterViewController
    extends AutoDisposeAsyncNotifier<RegisterViewState> {
  final AuthService _authService =
      InstanceController().getByType<AuthService>();

  FutureOr<RegisterViewState> build() {
    return RegisterViewState(
      username: '',
      password: '',
      birthDate: null,
      phoneNumber: '',
      message: '',
    );
  }

  void setUsername(String username) {
    state = AsyncValue.data(state.requireValue.copyWith(username: username));
  }

  void setPassword(String password) {
    state = AsyncValue.data(state.requireValue.copyWith(password: password));
  }

  void setBirthDate(DateTime birthDate) {
    state = AsyncValue.data(state.requireValue.copyWith(birthDate: birthDate));
  }

  void setPhoneNumber(String phoneNumber) {
    state =
        AsyncValue.data(state.requireValue.copyWith(phoneNumber: phoneNumber));
  }

  void register() async {
    state = const AsyncValue.loading();
    final response = await _authService.register(
      state.requireValue.username,
      state.requireValue.password,
      state.requireValue.birthDate!,
      state.requireValue.phoneNumber,
    );

    if (response == 'success') {
      state = AsyncValue.data(
          state.requireValue.copyWith(message: 'register_success'));
      return;
    } else if (response == 'error') {
      state = AsyncValue.error('register_error', StackTrace.current);
      return;
    }
  }
}
