import 'package:flutter/material.dart';
import 'package:notes/authentication/login.dart';
import 'package:notes/home_page.dart';
import 'package:notes/session/session_manager.dart';
import 'package:notes/utils/app_utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> navigateToNextScreen(BuildContext context) async {
      // Delay for 3 seconds
      await Future.delayed(const Duration(seconds: 3));
      SessionManager().getRegisterUser().then((isRegisterUser) {
        AppUtils().printLog("call navigationsplash screen ");
        if (isRegisterUser != null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(
                        registerResponse: isRegisterUser,
                      )));
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
      });
      // Navigate to the next screen
    }

    AppUtils().printLog("call navigationsplash screen main");
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
