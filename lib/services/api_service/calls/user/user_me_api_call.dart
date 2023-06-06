import 'package:dio/src/response.dart';

import '../../../../core/services/api_service/api_service.dart';
import '../../../../models/user_model/user_model.dart';

class UserMeApiCall extends IApiCall<UserModel> {
  const UserMeApiCall()
      : super(
          name: 'UserMeApiCall',
          method: HttpMethods.GET,
          path: '/bff/users/me',
          requiresArgs: false,
        );

  @override
  ResponseObject<UserModel>? parse(Response response) {
    if (response.data != null) {
      return ResponseObject.success(
          statusCode: response.statusCode ?? 200,
          data: UserModel.fromJson(response.data));
    }
    return ResponseObject.error(statusCode: response.statusCode ?? 500);
  }
}
