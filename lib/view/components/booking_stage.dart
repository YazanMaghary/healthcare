import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_constanses.dart';

class BookingStage extends StatelessWidget {
  final String stageName;
  final String stageNum;
  final TextStyle style;
  final Color backgroundColor;
  const BookingStage({super.key, required this.stageName, required this.stageNum, required this.style, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50.h,
          height: 50.h,
          decoration:  BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle
          ),
          child:  Center(child:
          Text(stageNum , style:const TextStyle(color: Colors.white),
          )),
        ),
        smallSpace4,
        Text(stageName , style: style,)
      ],
    );
  }
}
