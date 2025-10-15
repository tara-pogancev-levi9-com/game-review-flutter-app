import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';

class ReviewChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  const ReviewChip(this.label, {super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      backgroundColor: Colors.transparent,
      label: Text(label, style: const TextStyle(fontSize: 12)),
      avatar: icon != null
          ? Icon(
              icon,
              size: 14,
              color: AppColors.lilacSelected,
            )
          : null,
    );
  }
}
