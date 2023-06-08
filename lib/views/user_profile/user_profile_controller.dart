import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/instance_controller.dart';
import '../../models/user_model/user_model.dart';
import '../../services/auth_service/auth_service.dart';
import '../../services/user_service/user_service.dart';
import 'states/user_view_state.dart';

class UserProfileController extends AutoDisposeAsyncNotifier<UserViewState> {
  UserProfileController() : super();

  final UserService _userService =
      InstanceController().getByType<UserService>();

  @override
  FutureOr<UserViewState> build() async {
    try {
      final UserModel user = await _userService.getUser();
      return UserViewState(
          userName: user.userName,
          dateOfBirth: user.dateOfBirth,
          followerCount: user.followerCount,
          includePrivateInformation: user.includePrivateInformation,
          phoneNumber: user.phoneNumber);
    } catch (e) {
      rethrow;
    }
  }

  void logout() {
    InstanceController().getByType<AuthService>().logout();
  }
}
