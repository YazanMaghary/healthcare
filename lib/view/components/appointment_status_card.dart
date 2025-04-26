import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare/core/network/api_constances.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';

class AppointmentStatusCard extends StatelessWidget {
  final String appointmentStatues;
  final TextStyle? statusColor;
  final String doctorName;
  final String specializationName;
  final String date;
  final String time;
  final String image;
  final String review ; 
  final String rating; 
  const AppointmentStatusCard({
    super.key,
    required this.appointmentStatues,
    this.statusColor,
    required this.doctorName,
    required this.specializationName,
    required this.date,
    required this.time,
    required this.image, required this.review, required this.rating,
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
                        //Wed, 17 May
                        text: date,
                        style: smallNormalGrey12,
                      ),
                      TextSpan(
                        //08.30 AM
                        text: " | $time",
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
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    child: Image.network(
                      "${ApiConstances.baseUrl}/$image",
                      width: 70.w,
                      height: 70.w,
                      errorBuilder: (context, errorrz, stackTrace) {
                        return Image.asset(
                          defaultProfile,
                          width: 70.w,
                          height: 70.w,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorName,
                        style: semiBoldBlack16,
                      ),
                      smallSpace4,
                      Text(
                        specializationName,
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
                            
                            rating,
                            style: smallNormalGrey12,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "($review reviews)",
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
