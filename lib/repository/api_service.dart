import 'package:dio/dio.dart';
import 'package:notes/models/authentication/RegisterModel.dart';
import 'package:notes/models/authentication/RegisterResponse.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../models/notes/NoteModel.dart';
import '../models/notes/NoteResponse.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://192.168.29.185:3025/api/v1/")
abstract class ApiServices {

  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST("user/register")
  Future<RegisterResponse> register(@Body() RegisterModel registerUser);

  @POST("user/login")
  Future<RegisterResponse> login(@Body() RegisterModel registerUser);

  @POST("note/create")
  Future<NoteResponse> addNote(@Body() NoteModel noteModel);

}
