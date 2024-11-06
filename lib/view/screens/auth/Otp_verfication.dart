import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/components/register_sup_title.dart';
import 'package:healthcare/view/components/register_title.dart';

// ignore: must_be_immutable
class OtpVerficationScreen extends StatelessWidget {
  OtpVerficationScreen({super.key});
  List<TextEditingController> otpController =
      List.generate(4, (index) => TextEditingController());
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
            const RegisterTitle(text: "OTP Verification"),
            smallSpace,
            const RegisterSupTitle(
                text:
                    "Add a PIN number to make your account more secure and easy to sign in."),
            largeSpace,
            largeSpace,
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 100.h,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80.w,
                    width: 80.w,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: BorderRadius.circular(16.r)),
                    child: TextField(
                      controller: otpController[index],
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        if (value.length == 1 && index < 3) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: const InputDecoration(
                          hintText: '',
                          helperText: '',
                          counterText: '',
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: greyColor))),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            PrimaryButton(
              buttonText: "Submit",
              onPressed: () {},
            )
          ],
        ),
      )),
    );
  }
}
