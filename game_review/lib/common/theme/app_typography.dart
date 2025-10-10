import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppTypography {
  static const TextStyle gameTitle = TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w500,
    fontSize: 13,
  );

  static const TextStyle errorText = TextStyle(
    color: Colors.redAccent,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle heading = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

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

  static const TextStyle labelSmall = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyTextSecondary = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
  );

  static const TextStyle gameTitle28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
}
