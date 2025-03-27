
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';

class AppointmentStatusCard extends StatelessWidget {
  final String appointmentStatues ;
  final TextStyle? statusColor; 
  const AppointmentStatusCard({
    super.key, required this.appointmentStatues, this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 16.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //appointmer status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  appointmentStatues,
                  style: statusColor,
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
              ]),
              InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.more_vert,
                    size: 24.w,
                  )),
            ],
          ),
          smallSpace12,
          divider,
          smallSpace12,
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
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 16.w,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "4.8",
                            style: smallNormalGrey12,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "(4,279 reviews)",
                            style: smallNormalGrey12,
                          ),
                        ],
                      ),
                      smallSpace4
                    ],
                  )
                ],
              ),
              //icons messages
            ],
          ),

          // buttons
        ],
      ),
    );
  }
}
