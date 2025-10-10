import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_typography.dart';

class RatingSectionWidget extends StatelessWidget {
  final String title;
  final double rating;
  final ValueChanged<double> onChanged;

  const RatingSectionWidget({
    super.key,
    required this.title,
    required this.rating,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.heading,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () => onChanged((index + 1).toDouble()),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: index < rating
                      ? AppColors.textSecondary
                      : AppColors.outline,
                  size: 40,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
