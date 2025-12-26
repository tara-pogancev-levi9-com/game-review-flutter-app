import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_typography.dart';
import 'package:game_review/common/theme/border_size.dart';
import 'package:game_review/i18n/strings.g.dart';

class OverallSectionWidget extends StatelessWidget {
  final bool recommended;
  final Function(bool) onChanged;

  const OverallSectionWidget({
    super.key,
    required this.recommended,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.ratings.overall,
          style: AppTypography.heading,
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderSize.m.radius,
            border: Border.all(
              color: AppColors.outline,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                t.reviews.iRecommendThisGame,
                style: AppTypography.labelSmall,
              ),
              Switch(
                value: recommended,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
