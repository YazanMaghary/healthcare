import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';

class MySpeciailtyCard extends StatelessWidget {
  final String speciailtyImagePath;
  final String speciailtyType;

  const MySpeciailtyCard({
    super.key,
    required this.speciailtyImagePath,
    required this.speciailtyType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(50.r)),
          child: Image.network(
            speciailtyImagePath,
            width: 50.w,
            height: 50.w,
            errorBuilder: (context, errorrz, stackTrace) {
              return Image.asset(
                histologistImage,
                width: 50.w,
                height: 50.w,
              );
            },
          ),
        ),
        smallSpace12,
        Text(
          speciailtyType,
          style: smallnormallBlack12,
        )
      ],
    );
  }
}
