import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/services/api_service/api_service.dart';
import '../../core/services/event_pipe/event_pipe.dart';
import '../../core/services/global_navigator/global_navigator.dart';
import '../../core/utils/instance_controller.dart';
import '../../models/authentication/login_model/login_model.dart';
import '../api_service/calls/authentication/login_api_call.dart';
import '../api_service/calls/authentication/register_api_call.dart';
import '../user_service/user_service.dart';

class AuthService {
  final SharedPreferences _sharedPreferences =
      InstanceController().getByType<SharedPreferences>();
  final UserService _userService =
      InstanceController().getByType<UserService>();
  final Logger _logger = InstanceController().getByType<Logger>();
  final ApiService _apiService = InstanceController().getByType<ApiService>();
  final EventPipe _eventPipe = EventPipe.getInstance();

  String? _accessToken;
  String? _refreshToken;

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  bool get isLoggedIn => _accessToken != null;

  AuthService();

  void init() {
    _log('Initializing');
    _accessToken = _sharedPreferences.getString('access_token');
    _refreshToken = _sharedPreferences.getString('refresh_token');
    if (_accessToken == null) {
      _log('Not logged in');
      _sharedPreferences.remove('access_token');
      _sharedPreferences.remove('refresh_token');
      return;
    }
    _apiService.bearerToken = 'Bearer $_accessToken';
    _eventPipe.addListener(EventFromListener(
        name: 'Refresh Token Failed',
        listener: (item) {
          _log('Refresh Token Failed');
          _accessToken = null;
          _refreshToken = null;
          _sharedPreferences.remove('access_token');
          _sharedPreferences.remove('refresh_token');
          _navigateToLogin();
        },
        from: RefreshTokenInterceptor));
    _log('Access Token Registered to ApiService');
    _log('Initialized');
  }

  Future<String> register(String username, String password, DateTime dateTime,
      String phoneNumber) async {
    _log('Registering');
    final response = await _apiService.call(
        const RegisterApiCall(),
        RegisterApiCallArgs(
            username: username,
            password: password,
            birthDate: dateTime,
            phoneNumber: phoneNumber));

    if (response.statusCode == 409) {
      _log('Registration failed - username already exists');
      return 'err_username_exists';
    }

    if (response.statusCode != 200) {
      _log('Registration failed - unknown error (${response.statusCode})})');
      return 'err_unknown';
    }

    _log('Registration successful');
    return 'success';
  }

  Future<String> login(String username, String password) async {
    _log('Logging in');
    final response = await _apiService.call(const LoginApiCall(),
        LoginApiCallArgs(username: username, password: password));

    if (response.statusCode == 401) {
      _log('Login failed - invalid credentials');
      return 'err_login_failed_invalid_credentials';
    }

    if (response.statusCode != 200) {
      _log('Login failed - unknown error (${response.statusCode})})');
      return 'err_unknown';
    }

    final LoginModel loginModel = response.data;

    _accessToken = loginModel.accessToken;
    _refreshToken = loginModel.refreshToken;

    _sharedPreferences.setString('access_token', _accessToken!);
    _sharedPreferences.setString('refresh_token', _refreshToken!);
    _apiService.bearerToken = 'Bearer $_accessToken';

    _eventPipe.emit(EventItem<NavigateItem>(
      type: EventTypes.navigate,
      from: this.runtimeType,
      event: NavigateItem(
        route: '/home',
        type: NavigateType.pushAndRemoveUntil,
      ),
    ));

    _log('Logged in');
    return 'success';
  }

  Future<void> logout() async {
    _log('Logging out');
    _accessToken = null;
    _refreshToken = null;
    _userService.clear();
    _sharedPreferences.remove('access_token');
    _sharedPreferences.remove('refresh_token');
    _apiService.bearerToken = null;
    _navigateToLogin();
    _log('Logged out');
  }

  void _navigateToLogin() {
    _log('Navigating to login');
    _eventPipe.emit(EventItem<NavigateItem>(
      type: EventTypes.navigate,
      from: this.runtimeType,
      event: NavigateItem(
        route: '/auth/login',
        type: NavigateType.pushAndRemoveUntil,
      ),
    ));
  }

  void _log(String message, {Level level = Level.debug}) {
    _logger.log(level, '<AuthService>: $message');
  }

  void saveBearerToken(String token) {
    _sharedPreferences.setString('access_token', token);
  }
}
