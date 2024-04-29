import 'dart:convert';

import 'package:notes/models/authentication/RegisterResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager{
  Future<void> saveRegisterUser(RegisterResponse registerResponse) async {
    final prefs = await SharedPreferences.getInstance();
    final encodedUser = jsonEncode(registerResponse.toJson());
    await prefs.setString("registerUser", encodedUser);
  }

  Future<RegisterResponse?> getRegisterUser() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedUser = prefs.getString("registerUser");
    if(encodedUser != null){
      final decodeUser = jsonDecode(encodedUser);
      return RegisterResponse.fromJson(decodeUser);
    }else{
      return null;
    }
  }

  Future<void> logOutUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("registerUser");
  }
}