import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/authentication/login.dart';
import 'package:notes/authentication/register.dart';
import 'package:notes/home%20page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> navigateToNextScreen(BuildContext context) async {
      // Delay for 3 seconds
      await Future.delayed(const Duration(seconds: 3));

      // Navigate to the next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RegisterScreen()),
      );
    }

    navigateToNextScreen(context);
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: SafeArea(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset("assets/splash_logo.png")),
              const Text("Notes")
            ],
          )),
        ));
  }
}
