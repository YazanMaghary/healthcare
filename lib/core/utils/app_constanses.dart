import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_storage/get_storage.dart';

GetStorage? box = GetStorage();

EdgeInsetsGeometry mainPagePading =
    EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h);
const Color scaffoldBackgroundColor = Color(0xFFFFFFFF);
const Color primaryColor = Color(0xff247CFF);

const Color greyColor = Color(0xff9E9E9E);
const Color greyBackground = Color(0xffF5F5F5);
const Color searchBackground = Color(0xffB3B1B0);
const Color starsColor = Color(0xffFFD600);
const Color textSecColor = Colors.white;
const Color greyColor1 = Color(0xff616161);

const Color failureColor =  Color.fromARGB(255, 133, 49, 49);
const Color successfullyColor =  Color.fromARGB(255, 44, 207, 23);
SizedBox largeSpace = SizedBox(height: 32.h);
SizedBox smallSpace = SizedBox(height: 8.h);
SizedBox mediumSpace = SizedBox(height: 20.h);

TextStyle largeBold1 = GoogleFonts.inter(
    fontSize: 32, fontWeight: FontWeight.bold, color: const Color(0xff247CFF));
TextStyle smallNormal1 =
    GoogleFonts.inter(fontSize: 10, color: const Color(0xff757575));
TextStyle smallNormal2 =
    GoogleFonts.inter(fontSize: 10, color: greyColor1);
TextStyle semiBold1 = GoogleFonts.inter(
    fontSize: 16, color: scaffoldBackgroundColor, fontWeight: FontWeight.bold);
TextStyle semiBold2 =
    GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold);
TextStyle semiBold6 =
    GoogleFonts.inter(fontSize: 16 , fontWeight: FontWeight.w500);
TextStyle semiBold3 =
    GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold);
TextStyle semiBold4 =
    GoogleFonts.inter(color: const Color(0xffC2C2C2));
TextStyle semiBold8 =    GoogleFonts.inter(color: const Color(0xffC2C2C2) , fontWeight: FontWeight.bold);
TextStyle semiBold9 =
GoogleFonts.inter(fontSize: 12 , color: const Color(0xff757575));
TextStyle semiBold7 =
    GoogleFonts.inter(fontSize: 14 , color: const Color(0xff757575));
TextStyle semiBold5 =
    GoogleFonts.inter(color: Colors.white);
TextStyle semiBoldWite =
    GoogleFonts.inter(fontSize: 18 ,color: Colors.white);
