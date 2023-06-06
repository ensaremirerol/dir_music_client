import 'package:dio/src/response.dart';

import '../../../../core/services/api_service/api_service.dart';

class RegisterApiCall extends IApiCall<String> {
  const RegisterApiCall()
      : super(
          name: 'RegisterApiCall',
          method: HttpMethods.POST,
          path: '/bff/users/register',
          requiresArgs: true,
        );

  @override
  ResponseObject<String>? parse(Response response) {
    if (response.data != null) {
      return ResponseObject.success(
          statusCode: response.statusCode ?? 200, data: 'success');
    }
    return ResponseObject.error(statusCode: response.statusCode ?? 500);
  }
}

class RegisterApiCallArgs extends IApiCallArgs {
  final String username;
  final String password;
  final String phoneNumber;
  final DateTime birthDate;

  const RegisterApiCallArgs({
    required this.username,
    required this.password,
    required this.phoneNumber,
    required this.birthDate,
  }) : super(name: 'RegisterApiCall');

  @override
  getBody() {
    return {
      'userName': username,
      'password': password,
      'phoneNumber': phoneNumber,
      'birthDate': birthDate.toIso8601String(),
    };
  }
}
