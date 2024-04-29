import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/home%20page.dart';
import 'package:notes/models/authentication/RegisterModel.dart';
import 'package:notes/models/authentication/RegisterResponse.dart';
import 'package:notes/repository/api_service.dart';
import 'package:notes/session/session_manager.dart';
import 'package:notes/utils/app_utils.dart';
import 'package:notes/utils/error_convertor.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();

  var lastNameController = TextEditingController();

  var userNameController = TextEditingController();

  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var emailController = TextEditingController();
  var registerModel = RegisterModel();

  @override
  Widget build(BuildContext context) {
    Future<RegisterResponse> registerUser(RegisterModel registerModel) async {
      final client =
          ApiServices(Dio(BaseOptions(contentType: "application/json")));
      try {
        final response = await client.register(registerModel);
        return response;
      } on DioException catch (error) {
        var apiError = ErrorConverter().convert(error.response);
        return Future.error(apiError);
      }
    }

    firstNameController.text = "Vishal";
    lastNameController.text = "Bhimporwala";
    userNameController.text = "VishalBhimpor";
    passwordController.text = "vishal123";
    confirmPasswordController.text = "vishal123";
    emailController.text = "vishal@gmail.com";
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            constraints: const BoxConstraints.expand(),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter first name";
                        }
                        return null;
                      },
                      controller: firstNameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          hintText: "Enter first name",
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter last name";
                        }
                        return null;
                      },
                      controller: lastNameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          hintText: "Enter last name",
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter username";
                        }
                        return null;
                      },
                      controller: userNameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          hintText: "Enter user name",
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter email";
                        }
                        return null;
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: "Enter email address",
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                          hintText: "Enter password",
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter confirm password";
                        } else if (val != passwordController.text) {
                          return "Please confirm password";
                        }
                        return null;
                      },
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                          hintText: "Enter confirm password",
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    OutlinedButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() == true) {
                            registerModel = RegisterModel(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                email: emailController.text,
                                userName: userNameController.text,
                                password: confirmPasswordController.text);
                            print("register click");
                            registerUser(registerModel).then(
                                (registerResponse) {
                              if (registerResponse.success == true) {
                                AppUtils.showSnackBar(
                                    context, "User register successfully");
                                print(
                                    "user register ${registerResponse.data!.id}");
                                SessionManager()
                                    .saveRegisterUser(registerResponse);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage(
                                            registerResponse:
                                                registerResponse)));
                              } else {
                                AppUtils.showSnackBar(context,
                                    "User register failed${registerResponse.message}");
                                print("user registration failed");
                              }
                            }, onError: (error) {
                              AppUtils.showSnackBar(context,
                                  "User register failed${error.message}");
                            });
                          } else {
                            AppUtils.showSnackBar(
                                context, "Please fill all field properly");
                            print("register click but not validate");
                          }
                        },
                        child: const Text("Register"))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
