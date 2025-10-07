import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppTypography {
  static const TextStyle logoTitle = TextStyle(
    fontFamily: AppFonts.pixelifySans,
    color: AppColors.softWhite,
    fontSize: 36,
    fontWeight: FontWeight.w700,
    height: 1.0,
  );

  static const TextStyle logoTagline = TextStyle(
    fontFamily: AppFonts.josefinSans,
    color: AppColors.textTertiary,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.0,
  );

  static const TextStyle buttonLarge = TextStyle(
    fontFamily: AppFonts.josefinSans,
    fontWeight: FontWeight.w500,
    fontSize: 28,
  );
}
