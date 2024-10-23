import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/core/utils/app_constanses.dart';

class Themes {
  ThemeData mainTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: scaffoldBackgroundColor),
    useMaterial3: true,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
  );
}
