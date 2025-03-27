import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare/core/network/api_constances.dart';
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
          width: 50.w,
          height: 50.w,
          decoration:  BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "${ApiConstances.baseUrl}/$speciailtyImagePath",
                  )),
              shape: BoxShape.circle,
              color: greyBackground),
          padding: EdgeInsets.all(24.h),
        ),
       smallSpace12,
        Text(speciailtyType,style: smallnormallBlack12,)
      ],
    );
  }
}
