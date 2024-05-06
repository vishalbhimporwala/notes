import 'package:dio/dio.dart';
import 'package:notes/session/session_manager.dart';
import 'package:notes/utils/app_utils.dart';

class AccessTokenInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String? accessToken = response.headers.value("accessToken");
    AppUtils().printLog("accessToken from response  : $accessToken");
    if (accessToken != null && accessToken.isNotEmpty) {
      SessionManager().saveAccessToken(accessToken);
    }
    return handler.next(response);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await SessionManager().getAccessToken();
    AppUtils().printLog('request token $token');
    options.headers["Authorization"] = 'Bearer $token';
    return handler.next(options);
  }
}
