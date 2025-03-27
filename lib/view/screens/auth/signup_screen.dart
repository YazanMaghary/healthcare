import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/auth_controller.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/custom_text_field.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/components/register_sup_title.dart';
import 'package:healthcare/view/components/register_title.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());

  // Add controllers for each text field
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: mainPagePading,
            child: Form(
              key: _formKey,
              child: SizedBox(
                height: ScreenUtil().screenHeight - 90.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    largeSpace,
                    const RegisterTitle(text: 'Create an Account'),
                    smallSpace4,
                    const RegisterSupTitle(
                      text:
                          "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                    ),
                    largeSpace,
                    CustomTextField(
                      controller: nameController,
                      validator: authController.validateName,
                      hintText: 'Full Name',
                    ),
                    mediumSpace20,
                    CustomTextField(
                      controller: emailController,
                      validator: authController.validateEmail,
                      hintText: 'Email',
                    ),
                    mediumSpace20,
                    CustomTextField(
                      controller: passwordController,
                      validator: authController.validatePassword,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    mediumSpace20,
                    IntlPhoneField(
                        controller: phoneController,
                        initialCountryCode: "PS",
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        autofocus: false,
                        validator: (value) {
                          if (value == null || value.number.isEmpty) {
                            return 'Phone number is required';
                          }
                          final RegExp phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
                          if (!phoneRegex.hasMatch(value.completeNumber)) {
                            return 'Invalid phone number';
                          }
                          if (value.countryCode != "PS") {
                            return 'Please use the correct country code';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        invalidNumberMessage: "Invalid Number",
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: greyColor),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: greyColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.r))),
                          hintText: 'Your Number',
                        )),
                    mediumSpace20,

                    PrimaryButton(
                        buttonText: "Create Account",
                        onPressed: () async {
                          box?.write("email", emailController.text);
                          if (_formKey.currentState!.validate()) {
                            await authController.register(
                              nameController.text,
                              emailController.text,
                              passwordController.text,
                              phoneController.text,
                            );

                            box?.write("register", true);
                          }
                        }),
                    mediumSpace20,

                    const Spacer(),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(color: greyColor),
                          children: [
                            const TextSpan(
                                text: 'By logging, you agree to our '),
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
                                  Get.offNamed('/LoginScreen');
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
          ),
        ),
      ),
    );
  }
}
