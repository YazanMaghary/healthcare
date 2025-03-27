import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/datasource/auth_data_source.dart';
import 'package:healthcare/model/user_model.dart';
import 'package:healthcare/view/components/bottomsheet.dart';
import 'package:healthcare/core/utils/app_constanses.dart';

class AuthController extends GetxController {
  bool remmeberPassword = false;
  bool showPassword = true;
  bool isButtonEnabled = true;
  UserModel? userModel;
  User? user;
  AuthDataSource authDataSource = AuthDataSource();
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
  }
  void checkButton() {
    if (isButtonEnabled) {
      enableButton();
    } else {
      disableButton();
      update();
    }
  }

  void enableButton() {
    isButtonEnabled = true;
    update();
  }

  void disableButton() {
    isButtonEnabled = false;
    update();
  }

  Future<void> login(String email, String password) async {
    // final db = FirebaseFirestore.instance;
    disableButton();
    Timer(const Duration(seconds: 1), () async {
      final result = await authDataSource
          .login({"email": email, "password": password}).whenComplete(
        () async {
          enableButton();
        },
      );
      result.fold((failure) {
        print("Failed to login");
        failureWidget('Error', failure);
      }, (success) async {
        print("success to login");
        print(success.user?.name);
        userModel = success;
        print(success.token);
        // db.collection("${success.user?.id}").doc("First Doctor");
        //Here 1
        box?.write("Token", success.token);
        box?.write("remmeberPassword", remmeberPassword);
        // box?.write("Token2", success.token);

        if (success.user?.isVerified == true) {
          Get.offAllNamed("/MainAppScreen")?.whenComplete(
            () {
              print("ok route me");
            },
          );
        } else {
          Get.toNamed("/OtpVerficationScreen");
        }

        // Get.offAllNamed('/home');  // or whatever route you want
      });
    });
  }

  Future<void> register(
      String name, String email, String password, String phone) async {
    disableButton();
    Timer(
      const Duration(seconds: 1),
      () async {
        print(email);
        final result = await authDataSource.register({
          "name": name,
          "email": email,
          "password": password,
          "phone": phone
        }).whenComplete(
          () {
            enableButton();
          },
        );
        result.fold((failure) {
          failureWidget('Error', failure);
        }, (success) {
          // Handle successful login
          print(success.user?.id);
          box?.write("id", success.user!.id!);
          print("success");
          Get.toNamed("/OtpVerficationScreen");
          // Get.offAllNamed('/home');  // or whatever route you want
        });
      },
    );
  }

  void checkBoxState() {
    if (remmeberPassword == false) {
      remmeberPassword = true;
    } else {
      remmeberPassword = false;
    }
    update();
    print(remmeberPassword);
  }

  String? validateEmail(String? value) {
    // Check for null or empty value
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Check for spaces in the email
    if (value.contains(' ')) {
      return 'Email cannot contain spaces';
    }
    // Check for valid email format
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!RegExp(r'^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>])').hasMatch(value)) {
      return 'Password must contain at least one capital letter and one special character';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Name';
    }
    return null;
  }

  void showPasswordCheck() {
    if (showPassword == false) {
      showPassword = true;
    } else {
      showPassword = false;
    }
    update();
  }

  Future<void> verficationCode(String email, String otpCode) async {
    disableButton();
    Timer(
      const Duration(seconds: 1),
      () async {
        final result = await authDataSource
            .verficationCode({"email": email, "otpCode": otpCode}).whenComplete(
          () {
            enableButton();
          },
        );
        result.fold((failure) {
          enableButton();
          print("object");
          failureWidget('Error', failure);
        }, (success) {
          if (box?.read("register") == true) {
            Get.toNamed('/ProfilePictureScreen');
          } else if (box?.read("register") == false) {
            Get.toNamed(
              '/myMain',
            ); // or whatever route you want
          }
        });
      },
    );
  }

  Future<void> forgotPassword(String email) async {
    disableButton();
    Timer(
      const Duration(seconds: 1),
      () async {
        final result =
            await authDataSource.forgotPassword({"email": email}).whenComplete(
          () {
            enableButton();
          },
        );

        result.fold((failure) {
          print("object");
          failureWidget('Error', failure);
        }, (success) async {
          successfullyWidget(
              "Password Changed", "check email for new passwrod");
          await Get.offAllNamed("/LoginScreen");
        });
      },
    );
  }

  Future<User> tookenExpired() async {
    final result = await authDataSource.getMe(box?.read("Token") ?? "");
    result.fold((failure) {
      // Show dialog on failure

      Get.dialog(
        AlertDialog(
          title: const Text('Error',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          content: const Text('Your session has expired. Please log in again.',
              style: TextStyle(color: Colors.black)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: Colors.white,
          actions: [
            TextButton(
              onPressed: () {
                Get.offAllNamed("/LoginScreen");
              },
              child: const Text('OK', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
        barrierDismissible: false,
      );
    }, (success) {
      // Do nothing on success
      box?.write("User", success);
      user = success;
      return user;
    });
    update();
    return user ?? User();
  }
}
