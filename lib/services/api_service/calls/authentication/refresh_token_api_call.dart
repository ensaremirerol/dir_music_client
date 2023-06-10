import 'package:dio/src/response.dart';

import '../../../../core/services/api_service/api_service.dart';
import '../../../../models/authentication/refresh_model/refresh_model.dart';

class RefreshTokenApiCall extends IApiCall<RefreshModel> {
  const RefreshTokenApiCall()
      : super(
          name: 'RefreshTokenApiCall',
          method: HttpMethods.GET,
          path: '/bff/refresh?refreshToken={refreshToken}',
          requiresArgs: true,
        );

  @override
  ResponseObject<RefreshModel>? parse(Response response) {
    if (response.data != null) {
      return ResponseObject.success(
          statusCode: response.statusCode ?? 200,
          data: RefreshModel.fromJson(response.data));
    }
    return ResponseObject.error(statusCode: response.statusCode ?? 500);
  }
}

class RefreshTokenApiCallArgs extends IApiCallArgs {
  final String refreshToken;

  const RefreshTokenApiCallArgs({
    required this.refreshToken,
  }) : super(name: 'RefreshTokenApiCall');

  @override
  String pathFormat(String path) {
    return path.replaceAll('{refreshToken}', refreshToken);
  }
}
