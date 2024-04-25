import 'package:dio/dio.dart';
import 'package:notes/models/authentication/RegisterModel.dart';
import 'package:notes/models/authentication/RegisterResponse.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';


@RestApi(baseUrl: "http://127.0.0.1:3025/api/v1/")
abstract class ApiServices {


  @POST("user/register")
  Future<RegisterResponse> register(@Body() RegisterModel registerUser);
}
