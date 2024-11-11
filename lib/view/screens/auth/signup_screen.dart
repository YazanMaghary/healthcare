import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/custom_text_field.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/components/register_sup_title.dart';
import 'package:healthcare/view/components/register_title.dart';
import 'package:healthcare/view/screens/auth/Otp_verfication.dart';
import 'package:healthcare/view/screens/auth/login_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: mainPagePading,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              largeSpace,
              const RegisterTitle(text: 'Create an Account'),
              smallSpace,
              const RegisterSupTitle(
                text:
                    "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
              ),
              largeSpace,
              const CustomTextField(
                hintText: 'Full Name',
              ),
              mediumSpace,
              const CustomTextField(
                hintText: 'Email',
              ),
              mediumSpace,
              const CustomTextField(
                hintText: 'Password',
                obscureText: true,
              ),
              mediumSpace,
              IntlPhoneField(
                  initialCountryCode: "PS",
                  keyboardType: TextInputType.phone,
                  invalidNumberMessage: "Invalid Number",
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: greyColor),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: greyColor),
                        borderRadius: BorderRadius.all(Radius.circular(16.r))),
                    hintText: 'Your Number',
                  )),
              mediumSpace,
              PrimaryButton(
                  buttonText: "Create Account",
                  onPressed: () {
                    Get.to(() =>  OtpVerficationScreen(),
                        transition: Transition.rightToLeft);
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
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      const TextSpan(text: 'Already have account? '),
                      TextSpan(
                        text: 'Log In',
                        style: const TextStyle(color: primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.off(() =>  LoginScreen(),
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
