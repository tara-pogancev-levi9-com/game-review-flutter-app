import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_typography.dart';
import 'package:game_review/i18n/strings.g.dart';

class EmptyState extends StatelessWidget {
  final Translations t;
  const EmptyState({super.key, required this.t});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search_rounded,
            size: 80,
            color: AppColors.textSecondary,
          ),
          const SizedBox(height: 16),
          Text(
            t.searchGames,
            style: AppTypography.heading.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
