import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterTitle extends StatelessWidget {
  const RegisterTitle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }
}
