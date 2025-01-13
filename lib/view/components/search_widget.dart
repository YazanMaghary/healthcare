import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/app_images.dart';

class SearchWidget extends StatelessWidget {
  final String? hintText;
  const SearchWidget({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
      child: TextField(
        decoration: InputDecoration(
          hintText:hintText,
          hintStyle: GoogleFonts.inter(color: greyColor, fontSize: 12),
          prefixIcon: Image.asset(
            searchImage,
            width: 24.w,
            height: 24.w,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: searchBackground,
        ),
      ),
    );
  }
}
