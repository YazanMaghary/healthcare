import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/custom_text_field.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/components/register_sup_title.dart';
import 'package:healthcare/view/components/register_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              const CustomTextField(
                hintText: 'Email',
              ),
              mediumSpace,
              const CustomTextField(
                hintText: 'Password',
                obscureText: true,
              ),
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
                    onPressed: () {},
                    style: TextButton.styleFrom(foregroundColor: primaryColor),
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
              mediumSpace,
              PrimaryButton(buttonText: "Login", onPressed: () {}),
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
                        recognizer: TapGestureRecognizer()..onTap = () {},
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
