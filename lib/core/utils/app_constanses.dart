import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

double mainPagePading = 12.w;
const Color scaffoldBackgroundColor = Color(0xFFFFFFFF);
const Color primaryColor = Color(0xff247CFF);
TextStyle largeBold1 = GoogleFonts.inter(
    fontSize: 32, fontWeight: FontWeight.bold, color: const Color(0xff247CFF));
TextStyle smallNormal1 =
    GoogleFonts.inter(fontSize: 10, color: const Color(0xff757575));
TextStyle semiBold1 = GoogleFonts.inter(
    fontSize: 16, color: scaffoldBackgroundColor, fontWeight: FontWeight.bold);
