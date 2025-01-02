import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/auth_controller.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/custom_text_field.dart';
import 'package:healthcare/view/components/bottomsheet.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/components/register_sup_title.dart';
import 'package:healthcare/view/components/register_title.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthController authController = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              largeSpace,
              const RegisterTitle(text: 'Welcome Back'),
              smallSpace,
              const RegisterSupTitle(
                text:
                    "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
              ),
              largeSpace,
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        validator: authController.validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        hintText: 'Email',
                      ),
                      mediumSpace,
                      GetBuilder(
                        init: authController,
                        builder: (controller) {
                          return CustomTextField(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  authController.showPasswordCheck();
                                },
                                icon: const Icon(Icons.visibility_sharp)),
                            obscureText: authController.showPassword,
                            validator: authController.validatePassword,
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            hintText: 'Password',
                          );
                        },
                      ),
                    ],
                  )),
              mediumSpace,
              Row(
                children: [
                  GetBuilder(
                    init: authController,
                    builder: (GetxController controller) {
                      return Checkbox(
                        value: authController.remmeberPassword,
                        side: const BorderSide(color: greyColor),
                        onChanged: (value) {
                          authController.checkBoxState();
                        },
                      );
                    },
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(color: greyColor),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(
                        '/ForgotPasswordScreen',
                      );
                    },
                    style: TextButton.styleFrom(foregroundColor: primaryColor),
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
              mediumSpace,
              PrimaryButton(
                  buttonText: "Login",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        failureWidget("Error", "E-mail or Password is empty");
                      } else {
                        box?.write("email", emailController.text);
                        await authController.login(
                            emailController.text, passwordController.text);
                        box?.write("register", false);
                      }
                    }
                  }),
              mediumSpace,
              const Spacer(),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(color: greyColor),
                    children: [
                      const TextSpan(text: 'By logging, you agree to our '),
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: const TextStyle(color: primaryColor),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'PrivacyPolicy',
                        style: const TextStyle(color: primaryColor),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ),
              largeSpace,
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      const TextSpan(text: 'Already have an account yet? '),
                      TextSpan(
                        text: 'Sign Up',
                        style: const TextStyle(color: primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.offNamed(
                              '/SignupScreen',
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
