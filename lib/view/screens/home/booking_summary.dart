import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/controller/appoinment_controller.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/booking_stage.dart';
import 'package:healthcare/view/components/primary_button.dart';
import 'package:intl/intl.dart';

//seaeae
class BookingSummary extends StatefulWidget {
  const BookingSummary({super.key});

  @override
  State<BookingSummary> createState() => _BookingSummaryState();
}

class _BookingSummaryState extends State<BookingSummary> {
  DateTime dateTime = DateTime.parse(Get.arguments["dateTime"]);
  final appointmentController =
      Get.put<AppoinmentController>(AppoinmentController());
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, dd MMMM yyyy').format(dateTime);
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
                Get.offAndToNamed("/MainAppScreen");
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
        child: PrimaryButton(
          buttonText: 'Book Now',
          onPressed: () async {
            //Here

            await appointmentController
                .makeAnAppointment(
                    doctorId: Get.arguments["doctorId"],
                    dateTime: Get.arguments["dateTime"],
                    time: Get.arguments["time"],
                    type: Get.arguments["type"],
                    paymentMethod: Get.arguments["paymentMethod"],
                    subTotal: 120,
                    tax: 5,
                    total: 115,
                    paymentId: "payment${Random().nextInt(10000) + 1}")
                .whenComplete(
              () {
                Get.toNamed('/BookingDetails', arguments: {
                  "doctorId": Get.arguments["doctorId"],
                  "dateTime": Get.arguments["dateTime"],
                  "time": Get.arguments["time"],
                  "type": Get.arguments["type"],
                });
              },
            );
          },
        ),
      ),
      body: Padding(
        padding: mainPagePading,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          mediumSpace20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 20.h,
              ),
              BookingStage(
                stageName: 'Date & Time',
                stageNum: '1',
                style: smallNormalGrey,
                backgroundColor: greyColor2,
              ),
              SizedBox(
                width: 5.h,
              ),
              Container(
                color: const Color(0xffE0E0E0),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 1.h),
              ),
              SizedBox(
                width: 5.h,
              ),
              BookingStage(
                stageName: 'Payment',
                stageNum: '2',
                style: smallNormalGrey,
                backgroundColor: greyColor2,
              ),
              SizedBox(
                width: 5.h,
              ),
              Container(
                color: const Color(0xffE0E0E0),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 1.h),
              ),
              SizedBox(
                width: 5.h,
              ),
              BookingStage(
                stageName: 'Summary',
                stageNum: '3',
                style: smallNormal,
                backgroundColor: primaryColor,
              ),
              SizedBox(
                width: 20.h,
              ),
            ],
          ),
          largeSpace,
          Text(
            'Booking Information',
            style: semiBoldBlack16,
          ),
          mediumSpace20,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(image: AssetImage('assets/images/Date&Time.png')),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date & Time',
                    style: semiBoldBlack14,
                  ),
                  Text(
                    formattedDate,
                    style: semiBoldGrey12,
                  ),
                  Text(
                    Get.arguments["time"],
                    style: semiBoldGrey12,
                  ),
                ],
              ),
            ],
          ),
          smallSpace4,
          const Divider(
            indent: 10,
            endIndent: 10,
          ),
          smallSpace4,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                  image: AssetImage('assets/images/AppointmentType.png')),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Appointment Type',
                    style: semiBoldBlack14,
                  ),
                  Text(
                    Get.arguments["type"],
                    style: semiBoldGrey12,
                  ),
                ],
              ),
            ],
          ),
          smallSpace4,
          const Divider(
            indent: 10,
            endIndent: 10,
          ),
          largeSpace,
          Text(
            'Payment Information',
            style: semiBoldBlack16,
          ),
          mediumSpace20,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.payment,
                color: primaryColor,
                size: 24.w,
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Get.arguments['paymentMethod'],
                    style: semiBoldBlack14,
                  ),
                  Text(
                    '***** ***** ***** ${Get.arguments["last4"]}',
                    style: semiBoldGrey12,
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                  style: ButtonStyle(
                      side: const WidgetStatePropertyAll(
                          BorderSide(width: 1.5, color: primaryColor)),
                      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                          vertical: 8.h, horizontal: 16.w))),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'change',
                    style: GoogleFonts.inter(color: primaryColor, fontSize: 12),
                  ))
            ],
          ),
        ]),
      ),
    );
  }
}
