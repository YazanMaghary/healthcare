import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/booking_stage.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:healthcare/view/screens/home/booking_screen.dart';

class BookingPay extends StatefulWidget {
  const BookingPay({super.key});

  @override
  State<BookingPay> createState() => _BookingPayState();
}

class _BookingPayState extends State<BookingPay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        surfaceTintColor: const Color(0xFFFFFFFF),
        elevation: 0,
        leading: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {
                 Get.offAll(
                 const BookingScreen(),
                  transition: Transition.leftToRight,
          );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        title: const Text(
          'Book Appointment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PrimaryButton(buttonText: 'Continue', onPressed: () {
          Get.offAllNamed(
                '/BookingSummary'
          );
        },),
      ),
      body: Padding(
        padding: mainPagePading,
        child: Column(children: [
          mediumSpace,
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 20.h,),
                  BookingStage(
                    stageName: 'Date & Time',
                    stageNum: '1',
                    style: smallNormalGrey,
                    backgroundColor: greyColor2,),
                  SizedBox(width: 5.h,),
                  Container(
                    color: const Color(0xffE0E0E0),
                    padding: EdgeInsets.symmetric(horizontal: 24.w ,vertical: 1.h),
                  ),
                  SizedBox(width: 5.h,),
                  BookingStage(
                    stageName: 'Payment',
                    stageNum: '2',
                    style: smallNormal ,
                    backgroundColor: primaryColor,),
                  SizedBox(width: 5.h,),
                  Container(
                    color: const Color(0xffE0E0E0),
                    padding: EdgeInsets.symmetric(horizontal: 24.w ,vertical: 1.h),
                  ),
                  SizedBox(width: 5.h,),
                  BookingStage(
                    stageName: 'Summary',
                    stageNum: '3',
                    style: smallNormalGrey ,
                    backgroundColor: greyColor2,),
                  SizedBox(width: 20.h,),
                ],),

        ],),
      ),
    );
  }
}