import 'package:flutter/material.dart';
import 'app_colors.dart';

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
}
