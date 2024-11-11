import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/screens/auth/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            onBoardingAppBarImage,
            semanticLabel: 'App Logo',
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: mainPagePading,
            child: Column(
              children: [
                smallSpace,
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned.fill(
                        child: Opacity(
                          opacity: 0.1,
                          child: Image.asset(
                            vectorOnBoardingImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          doctorOnBoardingImage,
                          height: 0.5.sh,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: 0.4.sh,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.white,
                                Colors.white,
                                Colors.white.withOpacity(0),
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Best Doctor Appointment App",
                                style: largeBold1,
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Column(
                                  children: [
                                    PrimaryButton(
                                      onPressed: () async {
                                        await sharedPreferences!
                                            .setBool('firstTime', false);
                                        Get.offAll(
                                          () =>  LoginScreen(),
                                          transition: Transition.upToDown,
                                        );
                                      },
                                      buttonText: 'Get Started',
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                                      textAlign: TextAlign.center,
                                      style: smallNormal1,
                                    )
                                  ],
                                ),
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
