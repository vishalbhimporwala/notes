import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailOrUserNameController = TextEditingController();

  var passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

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
                    },
                    child: const Text("Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
