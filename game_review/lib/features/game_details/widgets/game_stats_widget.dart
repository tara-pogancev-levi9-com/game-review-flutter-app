import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/i18n/strings.g.dart';

class GameStatsWidget extends StatelessWidget {
  final String gameId;
  final Map<String, int> statistics;

  const GameStatsWidget({
    super.key,
    required this.gameId,
    required this.statistics,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCompactStatItem(
            context,
            icon: Icons.star,
            count: '${statistics['reviewsCount'] ?? 0}',
            label: t.gameDetails.reviewsCount
                .replaceAll('{count}', '${statistics['reviewsCount'] ?? 0}')
                .split(' ')
                .last,
          ),
          Container(
            width: 1,
            height: 20,
            color: AppColors.outline.withValues(alpha: 0.3),
          ),
          _buildCompactStatItem(
            context,
            icon: Icons.favorite,
            count: '${statistics['wishlistCount'] ?? 0}',
            label: t.gameDetails.wishlistCount
                .replaceAll('{count}', '${statistics['wishlistCount'] ?? 0}')
                .split(' ')
                .last,
          ),
          Container(
            width: 1,
            height: 20,
            color: AppColors.outline.withValues(alpha: 0.3),
          ),
          _buildCompactStatItem(
            context,
            icon: Icons.library_books,
            count: '${statistics['libraryCount'] ?? 0}',
            label: t.gameDetails.libraryCount
                .replaceAll('{count}', '${statistics['libraryCount'] ?? 0}')
                .split(' ')
                .last,
          ),
          Container(
            width: 1,
            height: 20,
            color: AppColors.outline.withValues(alpha: 0.3),
          ),
          _buildCompactStatItem(
            context,
            icon: Icons.thumb_up,
            count: '85%',
            label: t.gameDetails.overallRecommendation
                .replaceAll('{percentage}', '85')
                .split(' ')
                .last,
          ),
        ],
      ),
    );
  }

  Widget _buildCompactStatItem(
    BuildContext context, {
    required IconData icon,
    required String count,
    required String label,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: AppColors.lilacSelected,
          size: 18,
        ),
        const SizedBox(height: 4),
        Text(
          count,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.textSecondary,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
