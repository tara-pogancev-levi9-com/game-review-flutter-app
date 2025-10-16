import 'package:flutter/material.dart';
import 'package:game_review/common/models/review_model.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/features/home_screen/review_details.page.dart';
import 'package:game_review/features/home_screen/utils/formatters.dart';
import 'package:game_review/features/profile_screen/profile_page.dart';
import 'package:game_review/i18n/strings.g.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel review;
  final VoidCallback? onDetails;

  const ReviewCard({super.key, required this.review, this.onDetails});

  Widget _starRow(double? rating) {
    final v = (rating ?? 0).clamp(0, 10);
    final filled = (v / 2).round();
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: List.generate(5, (i) {
        return Icon(
          i < filled ? Icons.star : Icons.star_border,
          size: 16,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cover = review.game?.coverImageUrl;
    final gameTitle = review.game?.title ?? review.gameId;
    final excerpt = (review.content ?? '').trim();
    final createdAgo = formatTimeAgo(review.createdAt);
    final username = review.username ?? review.userId;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      color: AppColors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // large cover
            Container(
              height: 140,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
                image: cover != null
                    ? DecorationImage(
                        image: NetworkImage(cover),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: cover == null
                  ? const Center(
                      child: Icon(
                        Icons.image,
                        size: 48,
                      ),
                    )
                  : null,
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: Text(
                    gameTitle,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(createdAgo, style: theme.textTheme.bodySmall),
              ],
            ),

            const SizedBox(height: 8),

            if (excerpt.isNotEmpty)
              Text(
                excerpt,
                style: theme.textTheme.bodyMedium,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),

            const SizedBox(height: 12),

            Row(
              children: [
                _starRow(review.overallRating),
                const Spacer(),
                OutlinedButton(
                  onPressed: () {
                    if (onDetails != null) {
                      onDetails!();
                      return;
                    }
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ReviewDetailsPage(review: review),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  child: Text(t.details),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(Icons.person, size: 16),
                const SizedBox(width: 8),

                InkWell(
                  splashColor: AppColors.softWhite,
                  radius: 14,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          currentUserId: review.userId,
                          isStandalone: true,
                        ),
                      ),
                    );
                  },
                  child: Text(username, style: theme.textTheme.bodyMedium),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
