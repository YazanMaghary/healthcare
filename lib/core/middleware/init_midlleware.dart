import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

import '../utils/app_constanses.dart';

class InitMidlleware extends GetMiddleware {
  @override
  // TODO: implement priority
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    // TODO: implement redirect
    final token = box?.read("Token");
    final firstTime = box?.read("firstTime");
    final remmeberPassword = box?.read("remmeberPassword");

    print("Check if remmeber");
    print(remmeberPassword);
    if (firstTime == false) {
      if (remmeberPassword == false) {
        print("route to loginScreen");
        //test if the first time
        box?.remove("Token");
        box?.remove(
          "email",
        );
        box?.remove("password");
        box?.remove("register");
        return const RouteSettings(name: "/LoginScreen");
      } else {
        if (token == null) {
          box?.remove("Token");
          box?.remove(
            "email",
          );
          box?.remove("password");
          box?.remove("register");
          print("route to loginScreen");
          return const RouteSettings(name: "/LoginScreen");
        } else {
          print("Route To main page");
          print("token : $token");

          return const RouteSettings(name: "/MainAppScreen");
        }
      }
    } else {
      print("Route To OnboardingScreen");
      return const RouteSettings(name: '/OnboardingScreen');
    }
  }
}
