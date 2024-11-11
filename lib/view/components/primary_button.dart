import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare/core/utils/app_constanses.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  const PrimaryButton({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 52.h,
      child: SizedBox(
        width: double.infinity,
        height: 52.h,
        child: MaterialButton(
          onPressed: onPressed,
          color: primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0.r)),
          child: Text(
            buttonText,
            style: semiBold1,
          ),
        ),
      ),
    );
  }
}
