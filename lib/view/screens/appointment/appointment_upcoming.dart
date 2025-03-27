import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';

class AppointmentUpcoming extends StatelessWidget {
  const AppointmentUpcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 24.h),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(16.w),
          margin: EdgeInsets.only(bottom: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //doctor image and  doctor deetails
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        listviewItem1,
                        width: 70.w,
                        height: 70.w,
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr.Randy Morton",
                            style: semiBoldBlack16,
                          ),
                          smallSpace4,
                          Text(
                            "General Medical Checkup",
                            style: smallNormalGrey12,
                          ),
                          smallSpace4,
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Wed, 17 May",
                                  style: smallNormalGrey12,
                                ),
                                TextSpan(
                                  text: " | 08.30 AM",
                                  style: smallNormalGrey12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  //icons messages
                  InkWell(onTap: () {}, child: Image.asset(messageText))
                ],
              ),

              smallSpace16,
              divider,
              smallSpace16,
              // buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 140.w,
                    height: 38.h,
                    child: MaterialButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.w),
                        side: const BorderSide(color: primaryColor),
                      ),
                      onPressed: () {
                        print("Test");
                      },
                      child: Text(
                        "Cancel Appointment",
                        overflow: TextOverflow.ellipsis,
                        style: smallboldblue12,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 140.w,
                    height: 38.h,
                    child: MaterialButton(
                      color: primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.w),
                        side: const BorderSide(color: primaryColor),
                      ),
                      onPressed: () {
                          Get.toNamed('/RescheduleScreen');
                      },
                      child: Text(
                        "Reschedule",
                        style: semiBoldWhite12,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
