import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/auth_controller.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/custom_text_field.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/components/register_sup_title.dart';
import 'package:healthcare/view/components/register_title.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final AuthController authController = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: mainPagePading,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              largeSpace,
              const RegisterTitle(text: "Forgot Password"),
              smallSpace4,
              const RegisterSupTitle(
                  text:
                      "At our app, we take the security of your information seriously."),
              largeSpace,
              CustomTextField(
                hintText: "Email",
                controller: emailController,
                validator: authController.validateEmail,
              ),
              const Spacer(),
              GetBuilder(
                init: authController,
                builder: (GetxController controller) {
                  return PrimaryButton(
                      buttonText:
                          "Reset Password", //there is error when handlion one time press
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await authController
                              .forgotPassword(emailController.text);
                        }
                      });
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
