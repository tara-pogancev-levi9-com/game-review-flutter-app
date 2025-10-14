import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_typography.dart';

class RatingRowWidget extends StatelessWidget {
  final String label;
  final double rating;
  final ValueChanged<double> onChanged;

  const RatingRowWidget({
    super.key,
    required this.label,
    required this.rating,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTypography.labelSmall,
        ),
        Row(
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () => onChanged((index + 1).toDouble()),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: index < rating
                      ? AppColors.textSecondary
                      : AppColors.outline,
                  size: 24,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
