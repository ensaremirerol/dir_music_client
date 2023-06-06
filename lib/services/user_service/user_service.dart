import 'dart:async';

import 'package:logger/logger.dart';

import '../../core/services/api_service/api_service.dart';
import '../../core/utils/instance_controller.dart';
import '../../models/user_model/user_model.dart';
import '../api_service/calls/user/user_me_api_call.dart';

class UserService {
  UserModel? _userModel;

  final ApiService _apiService = InstanceController().getByType<ApiService>();
  final Logger _logger = InstanceController().getByType<Logger>();

  FutureOr<UserModel> getUser() async {
    _log('Getting user');
    if (_userModel == null) {
      _log('User not found, requesting');
      await _getUser();
    }
    return _userModel!;
  }

  Future<void> _getUser() async {
    _log('Requesting user');
    final ResponseObject response =
        await _apiService.call(const UserMeApiCall(), null);
    if (response.statusCode ~/ 100 == 2) {
      _userModel = response.data;
    } else {
      _log('Error getting user: ${response.error_code}', level: Level.error);
      Future.error(response.error_code ?? 'UNKNOWN_ERROR');
    }
  }

  void clear() {
    _userModel = null;
    _log('Cleared');
  }

  void _log(String message, {Level level = Level.debug}) {
    _logger.log(level, '<UserService>: $message');
  }
}
