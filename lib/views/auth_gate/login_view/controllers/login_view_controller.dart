import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/instance_controller.dart';
import '../../../../services/auth_service/auth_service.dart';
import '../states/login_view_state.dart';

class LoginViewController extends AsyncNotifier<LoginViewState> {
  final AuthService _authService =
      InstanceController().getByType<AuthService>();
  @override
  FutureOr<LoginViewState> build() {
    return LoginViewState(
      username: '',
      password: '',
      error: '',
    );
  }

  void setUsername(String username) {
    state = AsyncValue.data(state.requireValue.copyWith(username: username));
  }

  void setPassword(String password) {
    state = AsyncValue.data(state.requireValue.copyWith(password: password));
  }

  void login() async {
    state = const AsyncValue.loading();
    final response = await _authService.login(
      state.requireValue.username,
      state.requireValue.password,
    );

    if (response == 'success') {
      state = AsyncValue.data(state.requireValue.copyWith(error: ''));
      return;
    } else if (response == 'error') {
      state = AsyncValue.data(state.requireValue.copyWith(error: response));
      return;
    }
  }
}
