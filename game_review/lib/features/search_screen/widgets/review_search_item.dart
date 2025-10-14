import 'package:flutter/material.dart';
import 'package:game_review/common/models/review_model.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_typography.dart';
import 'package:game_review/common/theme/border_size.dart';
import 'package:game_review/features/home_screen/review_details.page.dart';

class ReviewSearchItem extends StatelessWidget {
  final ReviewModel review;

  const ReviewSearchItem({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ReviewDetailsPage(review: review),
          ),
        );
      },
      borderRadius: BorderSize.m.radius,
      child: Container(
        height: 180, // Ista visina kao i game card
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius: BorderSize.m.radius,
          border: Border.all(
            color: AppColors.outline,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Review Header - Badges
            Row(
              children: [
                // Rating Badge
                if (review.overallRating != null) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryPurple,
                      borderRadius: BorderSize.s.radius,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: AppColors.lilacSelected,
                          size: 18,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          review.overallRating!.toStringAsFixed(1),
                          style: AppTypography.smallText,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                ],

                // Recommended Badge
                if (review.recommended == true)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.successBackground,
                      borderRadius: BorderSize.s.radius,
                      border: Border.all(
                        color: AppColors.success,
                        width: 1,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.thumb_up_rounded,
                          color: AppColors.success,
                          size: 14,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Recommended',
                          style: AppTypography.smallText,
                        ),
                      ],
                    ),
                  ),

                const Spacer(),

                // Arrow Icon
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.textSecondary,
                  size: 24,
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Review Title
            if (review.title != null && review.title!.isNotEmpty) ...[
              Text(
                review.title!,
                style: AppTypography.labelSmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
            ],

            // Review Content Preview
            Expanded(
              child: review.content != null && review.content!.isNotEmpty
                  ? Text(
                      review.content!,
                      style: AppTypography.bodyTextSecondary,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )
                  : const SizedBox.shrink(),
            ),

            // Review Footer - Date
            const Divider(color: AppColors.outline, height: 20),
            Row(
              children: [
                const Icon(
                  Icons.access_time_rounded,
                  size: 14,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 6),
                Text(
                  _formatDate(review.createdAt),
                  style: AppTypography.searchItemSubtitle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()}y ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()}mo ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inMinutes}m ago';
    }
  }
}
