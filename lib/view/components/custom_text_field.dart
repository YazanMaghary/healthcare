import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare/core/utils/app_constanses.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextField({ 
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.onChanged,
    this.keyboardType, this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(validator: validator,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: greyColor),
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: greyColor),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
