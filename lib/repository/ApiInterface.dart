import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:notes/models/authentication/acces_token_interceptor.dart';

import 'api_service.dart';

class ApiInterFace {
  ApiServices getApiService() {
    final logInter = LogInterceptor(
        logPrint: (Object o) => debugPrint(o.toString()),
        error: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        request: true,
        requestHeader: true);
    final Dio dio = Dio(BaseOptions(contentType: "application/json"));
    dio.interceptors.add(logInter);
    dio.interceptors.add(AccessTokenInterceptor());
    return ApiServices(dio);
  }
}
