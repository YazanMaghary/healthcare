import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/components/register_sup_title.dart';
import 'package:healthcare/view/components/register_title.dart';
import 'package:healthcare/view/screens/home/main_app_screen.dart';

class ProfilePictureScreen extends StatelessWidget {
  const ProfilePictureScreen({super.key});

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
            const RegisterTitle(text: "Profile Picture"),
            smallSpace,
            const RegisterSupTitle(
                text:
                    "Add a profile picture to make your account more secure and easy to sign in."),
            const Spacer(),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 300.h,
                    height: 300.h,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("assets/images/listviewItem2.png"))),
                            child: SizedBox(width: 50.h,height: 50.h,
                          
                            ),
                  ),
                mediumSpace,
                  IconButton(onPressed: () {
                    
                  }, icon: const Icon(Icons.camera_alt_sharp),color: primaryColor,iconSize: 36.h,)
                ],
              ),
            ),
            const Spacer(),
            PrimaryButton(
              buttonText: "Set Picture",
              onPressed: () {
                Get.off(() => const myMain());
              },
            )
          ],
        ),
      )),
    );
  }
}
