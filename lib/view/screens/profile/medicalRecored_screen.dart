// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';

import 'package:healthcare/view/components/appBar.dart';
import 'package:healthcare/view/components/appbar_button.dart';

class MedicalrecoredScreen extends StatefulWidget {
  const MedicalrecoredScreen({super.key});

  @override
  State<MedicalrecoredScreen> createState() => _MedicalrecoredScreenState();
}

class _MedicalrecoredScreenState extends State<MedicalrecoredScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: "Medical Recored",
        foregroundColor: Colors.black,
        leadingWidget: AppBarButton(
            onTap: () {
              Get.back();
            },
            icon: Icons.chevron_left,
            margin: EdgeInsets.only(left: 16.w)),
        actions: [
          AppBarButton(
              onTap: () {},
              icon: Icons.more_horiz_outlined,
              margin: EdgeInsets.only(right: 16.w))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 24.w),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "This Month",
                  style: semiBoldBlack16,
                ),
                mediumSpace20,
                Row(
                  children: [
                    Text(
                      "Feb 25",
                      style: largeNormalGrey,
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Text(
                      "End of observation",
                      style: semiBoldBlack14,
                    ),
                  ],
                ),
                smallSpace12,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Feb 25",
                      style: largeNormalGrey,
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Blood Analysis",
                          style: semiBoldBlack14,
                        ),
                        smallSpace4,
                        Text("red blood cell : 4.10 million cells/mcL",style: smallNormalGrey12,),
                        smallSpace4,
                        Text("hemogoblin : 142 grams/L",style: smallNormalGrey12),
                        smallSpace4,
                        Text("hematocrit : 33.6%",style: smallNormalGrey12),
                        smallSpace4,
                        Text("white blood cells : 3.850 cells/mcL",style: smallNormalGrey12),
                        smallSpace4,
                      ],
                    ),
                  ],
                ),
                smallSpace12,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Feb 25",
                      style: largeNormalGrey,
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Blood Analysis",
                          style: semiBoldBlack14,
                        ),
                        smallSpace4,
                        Text("red blood cell : 3.90 million cells/mcL",style: smallNormalGrey12),
                        smallSpace4,
                        Text("hemogoblin : 122 grams/L",style: smallNormalGrey12),
                        smallSpace4,
                        Text("hematocrit : 47.7%",style: smallNormalGrey12),
                        smallSpace4,
                        Text("white blood cells : 4.300 cells/mcL",style: smallNormalGrey12),
                        smallSpace4,
                      ],
                    ),
                  ],
                ),largeSpace
              ],
            );
          },
        ),
      )),
    );
  }
}
