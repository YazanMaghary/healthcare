import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare/core/utils/app_constanses.dart';

class RegisterSupTitle extends StatelessWidget {
  final String text;
  const RegisterSupTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
               text,
                style: TextStyle(
                  color: greyColor,
                  fontSize: 14.sp,
                ),
              );
  }
}
