import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/custom_text_field.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/components/register_sup_title.dart';
import 'package:healthcare/view/components/register_title.dart';

import 'Otp_verfication.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: mainPagePading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            largeSpace,
            const RegisterTitle(text: "Forgot Password"),
            smallSpace,
            const RegisterSupTitle(
                text:
                    "At our app, we take the security of your information seriously."),
            largeSpace,
            const CustomTextField(hintText: "Email"),
            const Spacer(),
            PrimaryButton(
              buttonText: "Reset Password",
              onPressed: () {
                Get.to(() => OtpVerficationScreen(),
                    transition: Transition.rightToLeft);
              },
            )
          ],
        ),
      )),
    );
  }
}
