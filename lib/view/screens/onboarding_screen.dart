import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/screens/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(onBoardingAppBarImage),
          centerTitle: true,
        ),
        body: Container(
          
          padding: EdgeInsets.symmetric(horizontal: mainPagePading),
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 12.h,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        top: -200.h,
                        height: ScreenUtil().screenHeight,
                        width: ScreenUtil().screenWidth,
                        child: Opacity(
                          opacity: 0.1,
                          child: Image.asset(
                            vectorOnBoardingImage,
                            height: ScreenUtil().screenHeight * 0.70.h,
                            width: ScreenUtil().screenWidth,
                          ),
                        ),
                      ),
                      Image.asset(
                        doctorOnBoardingImage,
                        height: ScreenUtil().screenHeight * 0.70.h,
                        width: ScreenUtil().screenWidth,
                      ),
                      Positioned(
                        width: ScreenUtil().screenWidth,
                        height: 450.h,
                        bottom: 20.h,
                        child: Container(
                          // padding: EdgeInsets.only(top: 56.h),
                          alignment: Alignment.bottomCenter,
                          width: ScreenUtil().screenWidth,
                          height: 450.h,
                          decoration: const BoxDecoration(
                              gradient:  LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                Colors.white,
                                Colors.white,
                                Color.fromARGB(0, 255, 255, 255),
                              ])),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 170.h),
                                child: Text(
                                  "Best Doctor Appointment App",
                                  style: largeBold1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              //size problem
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  PrimaryButton(
                                    onPressed: () {
                                      sharedPreferences!
                                          .setBool('firstTime', false);
                                      Get.offAll(
                                        const LoginScreen(),
                                        transition: Transition.upToDown,
                                      );
                                    },
                                    buttonText: 'Get Started',
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                                    textAlign: TextAlign.center,
                                    style: smallNormal1,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
