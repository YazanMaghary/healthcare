import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/auth_controller.dart';
import 'package:healthcare/controller/profile_controller.dart';
import 'package:healthcare/core/network/api_constances.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';
import 'package:healthcare/model/user_model.dart';
import 'package:healthcare/view/components/appBar.dart';
import 'package:healthcare/view/components/appbar_button.dart';
import 'package:healthcare/view/components/custom_text_field.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

// ignore: must_be_immutable
class PersonalInformation extends GetView {
  PersonalInformation({super.key});
  final profileController = Get.put(ProfileController());
  final authController = Get.find<AuthController>();

  User user = box?.read("User");
  TextEditingController userName =
      TextEditingController(text: box?.read("User").name);
  TextEditingController phone =
      TextEditingController(text: box?.read("User").phone);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar(
        title: "Personal Information",
        foregroundColor: Colors.black,
        tranparent: true,
        leadingWidget: AppBarButton(
            onTap: () {
              Get.back();
            },
            icon: Icons.chevron_left,
            margin: EdgeInsets.only(left: 16.w)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 48.w),
              child: Stack(children: [
                Container(
                  alignment: Alignment.topCenter,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100.r)),
                  child: GetBuilder<ProfileController>(
                      init: ProfileController(),
                      builder: (controller) {
                        return ClipOval(
                            child: Image.network(
                          "${ApiConstances.baseUrl}/${authController.user?.image}",
                          width: 120.w,
                          height: 120.w,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(defaultProfile,
                                width: 120.w, height: 120.w, fit: BoxFit.fill);
                          },
                        ));
                      }),
                ),
                Positioned(
                    right:
                        (MediaQuery.of(context).size.width / 2) - (135.w / 2),
                    bottom: 0.w,
                    child: Container(
                        decoration: BoxDecoration(
                            color: searchBackground,
                            borderRadius: BorderRadius.circular(24.r)),
                        width: 30.w,
                        height: 30.w,
                        child: InkWell(
                          onTap: () {
                            profileController.pickImage();
                           
                          },
                          child: Icon(
                            Icons.edit_outlined,
                            color: primaryColor,
                            size: 20.sp,
                          ),
                        )))
              ]),
            ),
            //Form
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: userName,
                    hintText: 'Full Name',
                  ),
                  mediumSpace20,
                  CustomTextField(
                    hintText: 'Email',
                    initialValue: user.email,
                    enabled: false,
                  ),
                  mediumSpace20,
                  CustomTextField(
                    enabled: false,
                    hintText: 'Password',
                    initialValue: box?.read("password"),
                  ),
                  mediumSpace20,
                  IntlPhoneField(
                      controller: phone,
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

                  const Center(
                    child: Text(
                        "When you set up your personal information settings, you should take care to provide accurate information."),
                  ),
                  largeSpace,
                  largeSpace,
                  PrimaryButton(
                      buttonText: "Save",
                      onPressed: () async {
                      
                        if (profileController.image == null ||
                            // ignore: unrelated_type_equality_checks
                            profileController.image == "") {
                        
                          await ProfileController()
                              .updateUserProfile(
                                  name: userName.text, phone: phone.text)
                              .whenComplete(
                            () async {
                              await authController.tookenExpired();
                            },
                          );
                        } else {
                          await ProfileController()
                              .updateUserProfileWithImage(userName.text,
                                  phone.text, profileController.image, true)
                              .whenComplete(
                            () async {
                              await authController.tookenExpired();
                            },
                          );
                        }
                      }),

                  // const Spacer(),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
