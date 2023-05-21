import 'package:dio/src/response.dart';

import '../../../../core/services/api_service/api_service.dart';
import '../../../../models/authentication/login_model/login_model.dart';

class LoginApiCall extends IApiCall<LoginModel> {
  const LoginApiCall()
      : super(
          name: 'LoginApiCall',
          method: HttpMethods.POST,
          path: '/dir-authentication-service/login',
          requiresArgs: true,
        );

  @override
  ResponseObject<LoginModel>? parse(Response response) {
    if (response.data != null) {
      return ResponseObject.success(
          statusCode: response.statusCode ?? 200,
          data: LoginModel.fromJson(response.data));
    }
    return ResponseObject.error(statusCode: response.statusCode ?? 500);
  }
}

class LoginApiCallArgs extends IApiCallArgs {
  final String username;
  final String password;

  const LoginApiCallArgs({
    required this.username,
    required this.password,
  }) : super(name: 'LoginApiCall');

  @override
  getBody() {
    return {
      'username': username,
      'password': password,
    };
  }
}
