import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/authentication/RegisterModel.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

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
                          } else {
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
