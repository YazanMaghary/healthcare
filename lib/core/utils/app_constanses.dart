import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_storage/get_storage.dart';

GetStorage? box = GetStorage();
//Colors
EdgeInsetsGeometry mainPagePading =
    EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h);
const Color scaffoldBackgroundColor = Color(0xFFFFFFFF);
const Color primaryColor = Color(0xff247CFF);

const Color greyColor = Color(0xff9E9E9E);
const Color redColor = Color(0xffFF4C5E);
const Color greyColor2 = Color(0xffE0E0E0);
const Color inactiveTrackColor = Color(0xffD9DEE2);
const Color inactiveThumbColor = Color(0xffD9DEE2);
const Color lightgreyColor = Color(0xffEDEDED);
const Color greyBackground = Color(0xffF5F5F5);
const Color greyBackground2 = Color(0xffF8F8F8);
const Color searchBackground = Color(0xffF2F4F7);
const Divider divider =      Divider(height: 1,color: lightgreyColor,);
const Color starsColor = Color(0xffFFD600);
const Color textSecColor = Colors.white;
const Color failureColor = Color.fromARGB(255, 133, 49, 49);
const Color successfullyColor = Color.fromARGB(255, 44, 207, 23);
SizedBox largeSpace = SizedBox(height: 32.h);
SizedBox smallSpace = SizedBox(height: 8.h);
SizedBox smallSpace12 = SizedBox(height: 12.h);
SizedBox mediumSpace = SizedBox(height: 20.h);
//Text And String styles
TextStyle largeBoldBlue = GoogleFonts.inter(
    fontSize: 32, fontWeight: FontWeight.bold, color: const Color(0xff247CFF));
TextStyle smallNormalGrey =
    GoogleFonts.inter(fontSize: 10, color: const Color(0xff757575));
TextStyle smallNormalWhite =
    GoogleFonts.inter(fontSize: 10, color: const Color(0xffffffff));
TextStyle mediumNormalGrey =
    GoogleFonts.inter(fontSize: 12, color: const Color(0xff757575));
TextStyle mediumNormalBlack =
    GoogleFonts.inter(fontSize: 12,color: Colors.black);
TextStyle largeNormalGrey =
    GoogleFonts.inter(fontSize: 14, color: const Color(0xff757575));
TextStyle largeNormalBlack=
    GoogleFonts.inter(fontSize: 14, );
TextStyle largeNormalRed=
    GoogleFonts.inter(fontSize: 14,color: redColor );
TextStyle verylargeNormalRed=
    GoogleFonts.inter(fontSize: 16,color: redColor );
TextStyle verylargeNormalBlue=
    GoogleFonts.inter(fontSize: 16,color: primaryColor );
TextStyle verylargeNormalBlack=
    GoogleFonts.inter(fontSize: 16,color: Colors.black );
TextStyle semiBoldWhite = GoogleFonts.inter(
    fontSize: 16, color: scaffoldBackgroundColor, fontWeight: FontWeight.bold);

TextStyle semiBoldBlack18 =
    GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold);
TextStyle semiBoldBlack20 =
    GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold);
TextStyle semiBoldBlack16 =
    GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold);
TextStyle semiBoldGrey = GoogleFonts.inter(color: const Color(0xffC2C2C2));
TextStyle semiBoldWhite2 = GoogleFonts.inter(color: Colors.white);
TextStyle semiBoldBlack14 =
    GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold);
