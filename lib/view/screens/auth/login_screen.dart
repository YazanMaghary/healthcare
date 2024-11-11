import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/auth_controller.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/custom_text_field.dart';
import 'package:healthcare/view/components/failure.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/components/register_sup_title.dart';
import 'package:healthcare/view/components/register_title.dart';
import 'package:healthcare/view/screens/auth/forgot_password_screen.dart';
import 'package:healthcare/view/screens/auth/signup_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthController auth_controller = Get.put(AuthController());
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
                        validator:auth_controller.validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        hintText: 'Email',
                      ),
                      mediumSpace,
                      CustomTextField(
                        validator:auth_controller.validatePassword,
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                    ],
                  )),
              mediumSpace,
              Row(
                children: [
                  Checkbox(
                    value: false,
                    side: const BorderSide(color: greyColor),
                    onChanged: (value) {},
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(color: greyColor),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const ForgotPasswordScreen(),
                          transition: Transition.rightToLeft);
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
                        final authController = Get.put(AuthController());
                        await authController.login(
                            emailController.text, passwordController.text);
                      }
                    }
                 ),
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
                            Get.off(() => const SignupScreen(),
                                transition: Transition.rightToLeft);
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
