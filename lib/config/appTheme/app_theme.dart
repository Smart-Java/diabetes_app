import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../appColors/app_colors.dart';

class AppTheme {
  static ThemeData day() {
    final base = ThemeData.light();
    return base.copyWith(
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColors.primaryColor,
      ),
      appBarTheme: const AppBarTheme(color: AppColors.appBar),
      buttonTheme:
          const ButtonThemeData().copyWith(buttonColor: AppColors.primaryColor),
      textTheme: _buildAppLightTextTheme(base.textTheme),
    );
  }
}

TextTheme _buildAppLightTextTheme(TextTheme base) {
  return base.copyWith(
    headlineLarge: GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.whiteColor,
    ),
    headline1: GoogleFonts.roboto(
      fontSize: 26,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.5,
      color: AppColors.appTitleColor,
    ),
    headline2: GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor,
    ),
    headline3: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.0,
      color: AppColors.appTitleColor,
    ),
    headline4: GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.25,
      color: AppColors.appTitleColor,
    ),
    headline5: GoogleFonts.roboto(
      fontSize: 38,
      fontWeight: FontWeight.bold,
      color: AppColors.appTitleColor,
      letterSpacing: 1.0,
    ),
    headline6: GoogleFonts.roboto(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: AppColors.textColor,
    ),
    subtitle1: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: AppColors.textColor,
    ),
    subtitle2: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: AppColors.primaryColor,
    ),
    bodyText1: GoogleFonts.roboto(
      fontSize: 15.8,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor,
    ),
    bodyText2: GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor,
    ),
    button: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.25,
      color: AppColors.buttonTextColor,
      // backgroundColor: AppColors.primaryColor,
    ),
    caption: GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: AppColors.textColor,
    ),
    overline: GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      color: AppColors.primaryColor,
    ),
  );
}
