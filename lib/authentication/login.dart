import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/authentication/register.dart';
import 'package:notes/home%20page.dart';
import 'package:notes/models/authentication/RegisterModel.dart';
import 'package:notes/models/authentication/RegisterResponse.dart';
import 'package:notes/repository/api_service.dart';
import 'package:notes/session/session_manager.dart';
import 'package:notes/utils/app_utils.dart';
import 'package:notes/utils/error_convertor.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailOrUserNameController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var registerModel = RegisterModel();

  Future<RegisterResponse> login(RegisterModel registerModel) async {
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
    final client = ApiServices(dio);
    try {
      final registerResponse = await client.login(registerModel);
      return registerResponse;
    } on DioException catch (error) {
      final apiError = ErrorConverter().convert(error.response);
      return Future.error(apiError);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailOrUserNameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please enter value";
                      }
                      return null;
                    },
                    controller: emailOrUserNameController,
                    decoration: const InputDecoration(
                        hintText: "Enter username or email address",
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 20),
                TextFormField(
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please enter value";
                      }
                      return null;
                    },
                    controller: passwordController,
                    decoration: const InputDecoration(
                        hintText: "Enter password",
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.visiblePassword),
                const SizedBox(height: 20),
                OutlinedButton(
                    onPressed: () {
                      formKey.currentState?.validate();
                      print("login click");
                      if (AppUtils().isEmail(emailOrUserNameController.text)) {
                        registerModel = RegisterModel(
                            email: emailOrUserNameController.text,
                            password: passwordController.text);
                      } else {
                        registerModel = RegisterModel(
                            userName: emailOrUserNameController.text,
                            password: passwordController.text);
                      }
                      login(registerModel).then((registerResponse) {
                        AppUtils.showSnackBar(
                            context, "User login successfully");
                        SessionManager().saveRegisterUser(registerResponse);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage(
                                      registerResponse: registerResponse,
                                    )));
                      }, onError: (apiError) {
                        AppUtils.showSnackBar(context, apiError.message);
                      });
                    },
                    child: const Text("Login")),
                ElevatedButton(
                    onPressed: () {
                      AppUtils().printLog("Register navigate click");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                    child: const Text("New user register"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
