import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/auth_controller.dart';
import 'package:healthcare/core/network/api_constances.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';
import 'package:healthcare/view/components/appBar.dart';
import 'package:healthcare/view/components/appbar_button.dart';
import 'package:healthcare/view/components/customprofile_card.dart';

class ProfileScreen extends GetView {
  ProfileScreen({super.key});
  final AuthController authController = Get.find<AuthController>();
  // User user = box?.read("User");
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: primaryColor,
      appBar: appBar(
        title: "Profile",
        foregroundColor: Colors.white,
        tranparent: true,
        leadingWidget: AppBarButton(
            onTap: () {
              Get.offAllNamed("/MainAppScreen", arguments: 0);
            },
            icon: Icons.chevron_left,
            margin: EdgeInsets.only(left: 16.w)),
        actions: [
          AppBarButton(
              onTap: () {
                Get.toNamed("/SettingScreen");
              },
              icon: Icons.settings_outlined,
              margin: EdgeInsets.only(right: 16.w))
        ],
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: ScreenUtil().screenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.r),
                      topRight: Radius.circular(32.r)),
                  color: Colors.white),
              height: ScreenUtil().screenHeight - 250.h,
              //Containere children
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: (32 + 50).w),
                    child: Text(
                      authController.user?.name ?? "",
                      style: semiBoldBlack20,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8.h, bottom: 8.w),
                    child: Text(
                     authController.user?.email ?? "",
                      style: largeNormalGrey,
                    ),
                  ),
                  mediumSpace20,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    decoration: BoxDecoration(
                        color: greyBackground2,
                        borderRadius: BorderRadius.circular(24.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            print("object");
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                vertical: 24.w, horizontal: 26.w),
                            decoration: const BoxDecoration(
                              color: greyBackground2,
                            ),
                            child: Text(
                              "My Appoinmnet",
                              style: mediumNormalBlack,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(color: greyColor2),
                          height: 50.h,
                          width: 2.w,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed("/MedicalRecoredScreen");
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 24.w, horizontal: 26.w),
                            decoration: const BoxDecoration(
                              color: greyBackground2,
                            ),
                            child: Text(
                              "Medical Records",
                              style: mediumNormalBlack,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.w),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          CustomprofileCard(
                              onTap: () {
                                Get.toNamed("/PersonalInformation");
                              },
                              text: "Perstonal Information",
                              image: personcard),
                          divider,
                          CustomprofileCard(
                              onTap: () {},
                              text: "My Test & Diagnostic",
                              image: testicon),
                          divider,
                          CustomprofileCard(
                              onTap: () {
                                // await  StripeServices.instance.initPaymentSheet();\
                                //remove payment widget after test payment screen
                                Get.toNamed("/PaymentScreen");
                              },
                              text: "Payment",
                              image: paymentdard),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 25.w,
            right: (MediaQuery.of(context).size.width / 2) - (120.w / 2),
            child: Stack(children: [
              Container(
                alignment: Alignment.topCenter,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100.r)),
                child: ClipOval(
                  child: box?.read("User").image != "" ||
                          box?.read("User").image != null
                      ? Image.network(
                          "${ApiConstances.baseUrl}/${authController.user?.image}",
                          width: 120.w,
                          height: 120.w,
                          fit: BoxFit.fill,
                        )
                      : Image.asset("assets/images/defaultProfile.jpg",
                          width: 120.w, height: 120.w, fit: BoxFit.fill),
                ),
              ),
            ]),
          )
        ],
      )),
    );
  }
}
