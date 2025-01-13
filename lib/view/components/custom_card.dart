import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare/core/utils/app_constanses.dart';

class mySpeciailtyCard extends StatelessWidget {
  final String speciailtyImagePath;
  final String speciailtyType;

  const mySpeciailtyCard({
    super.key,
    required this.speciailtyImagePath,
    required this.speciailtyType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: greyBackground),
          padding:  EdgeInsets.all(24.h),
          child: Image.asset(
            speciailtyImagePath,
            fit: BoxFit.cover,
            width: 25.w,
            height: 25.h,
          ),
        ),
         SizedBox(
          height: 5.h,
        ),
        Text(speciailtyType)
      ],
    );
  }
}
