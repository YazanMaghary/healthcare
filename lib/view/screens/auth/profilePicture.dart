// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/profile_controller.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/components/register_sup_title.dart';
import 'package:healthcare/view/components/register_title.dart';

class ProfilePictureScreen extends StatelessWidget {
  ProfilePictureScreen({super.key});
  final ProfileController profilePictureController =
      Get.put(ProfileController());

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
            smallSpace4,
            const RegisterSupTitle(
                text:
                    "Add a profile picture to make your account more secure and easy to sign in."),
            const Spacer(),
            Center(
              child: Column(
                children: [
                  GetBuilder(
                    init: ProfileController(),
                    builder: (controller) => Container(
                      width: 300.h,
                      height: 300.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: controller.image != null
                              ? FileImage(
                                  controller.image!) // Show selected image
                              : const AssetImage(
                                  "assets/images/defaultProfile.jpg"), // Default image
                        ),
                      ),
                      child: SizedBox(
                        width: 50.h,
                        height: 50.h,
                      ),
                    ),
                  ),
                  mediumSpace20,
                  GetBuilder(
                    init: ProfileController(),
                    builder: (controller) {
                      return IconButton(
                        onPressed: controller.pickImage,
                        icon: const Icon(Icons.camera_alt_sharp),
                        color: primaryColor,
                        iconSize: 36.h,
                      );
                    },
                  )
                ],
              ),
            ),
            const Spacer(),
            PrimaryButton(
              buttonText: "Set Picture",
              onPressed: () async {
               

                await profilePictureController.updateUserProfileWithImage(
                    "", "", profilePictureController.image,false);
                box?.remove("Token2");
                box?.remove("register");
                // Get.offAllNamed('/myMain');
              },
            )
          ],
        ),
      )),
    );
  }
}
