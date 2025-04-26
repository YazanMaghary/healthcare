import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../utils/app_constanses.dart';

class InitMidlleware extends GetMiddleware {
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    final token = box?.read("Token");
    final firstTime = box?.read("firstTime");
    final remmeberPassword = box?.read("remmeberPassword");
    if (firstTime == false) {
      if (remmeberPassword == false) {
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
          return const RouteSettings(name: "/LoginScreen");
        } else {
          return const RouteSettings(name: "/MainAppScreen");
        }
      }
    } else {
      return const RouteSettings(name: '/OnboardingScreen');
    }
  }
}
