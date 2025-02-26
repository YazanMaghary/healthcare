import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare/core/utils/app_constanses.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool? enabled;
  final String? initialValue;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? suffixIcon ;
  const CustomTextField({ 
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.onChanged,
    this.keyboardType, this.validator, this.suffixIcon, this.initialValue, this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(validator: validator,
      controller: controller,enabled: enabled,
      obscureText: obscureText,
      onChanged: onChanged,initialValue: initialValue,
      keyboardType: keyboardType,
      decoration: InputDecoration(suffixIcon: suffixIcon,focusedBorder:OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(16.r),
        ),
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
