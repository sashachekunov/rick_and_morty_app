import 'package:chekunov_rick_and_morty_client/core/app_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle bottonNavigationBarTextStyle = TextStyle(
    fontFamily: GoogleFonts.notoSans().fontFamily,
    color: AppColors.greyColor,
    fontWeight: FontWeight.w900,
  );
  static TextStyle appBarTextStyle = TextStyle(
    fontFamily: GoogleFonts.notoSans().fontFamily,
    color: AppColors.logoColor,
    fontWeight: FontWeight.w900,
  );
  static TextStyle infoTextStyle = TextStyle(
    fontFamily: GoogleFonts.notoSans().fontFamily,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );
}
