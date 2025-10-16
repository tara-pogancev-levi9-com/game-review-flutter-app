import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/border_size.dart';

import 'app_typography.dart';

final ButtonStyle elevatedButtonLargeStyle = ElevatedButton.styleFrom(
  backgroundColor: AppColors.softWhite,
  foregroundColor: Colors.black,
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  shape: RoundedRectangleBorder(
    borderRadius: BorderSize.m.radius,
  ),
  textStyle: AppTypography.buttonLarge,
);

final ButtonStyle elevatedButtonSmallStyle = ElevatedButton.styleFrom(
  backgroundColor: AppColors.softWhite,
  foregroundColor: Colors.black,
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  shape: RoundedRectangleBorder(
    borderRadius: BorderSize.s.radius,
  ),
  textStyle: AppTypography.smallText,
);
