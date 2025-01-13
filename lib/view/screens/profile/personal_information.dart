import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';
import 'package:healthcare/view/components/appBar.dart';
import 'package:healthcare/view/components/appbar_button.dart';
import 'package:healthcare/view/components/custom_text_field.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PersonalInformation extends StatelessWidget {
  PersonalInformation({super.key});
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
                  child: Image.asset(profileImage, width: 120.w, height: 120.w),
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
                            print("Test");
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
                  PrimaryButton(buttonText: "Save", onPressed: () async {}),

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
