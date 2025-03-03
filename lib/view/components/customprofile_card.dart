import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare/core/utils/app_constanses.dart';

class CustomprofileCard extends StatelessWidget {
  final String text;
  final String image;
  final void Function()? onTap;
  const CustomprofileCard(
      {super.key, required this.text, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Image.asset(image),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Text(
                text,
                style: largeNormalBlack14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
