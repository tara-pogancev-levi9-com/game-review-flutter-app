import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_typography.dart';
import 'package:game_review/common/theme/border_size.dart';

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
          'Overall',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surfaceVariant.withValues(alpha: 0.6),
            borderRadius: BorderSize.m.radius,
            border: Border.all(
              color: AppColors.lilacSelected.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'I recommend this game *',
                style: AppTypography.labelSmall,
              ),
              Switch(
                value: recommended,
                onChanged: onChanged,
                activeColor: AppColors.lilacSelected,
                activeTrackColor: AppColors.primaryPurple,
                inactiveThumbColor: AppColors.lilacSelected,
                inactiveTrackColor: AppColors.textSecondary.withValues(
                  alpha: 0.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
