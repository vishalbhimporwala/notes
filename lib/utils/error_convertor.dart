import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:notes/models/error/ApiError.dart';
import 'package:notes/utils/app_utils.dart';

class ErrorConverter extends Converter<dynamic, dynamic> {
  @override
  ApiError convert(input) {
    if (input.statusCode! >= 400) {
      try {
        final json = jsonDecode(input.toString());
        AppUtils().printLog('error log : ${json}');
        return ApiError.fromJson(json);
      } on DioException catch (e) {
        print("convert error ${e.message}");
        // Handle potential parsing errors here (optional)
        rethrow;
      }
    } else {
      // Handle successful responses if needed
      throw Exception('Unexpected response');
    }
  }
}
