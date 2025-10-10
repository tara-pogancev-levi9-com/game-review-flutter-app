import 'package:flutter/material.dart';
import 'package:game_review/common/models/review_model.dart';
import 'package:game_review/features/home_screen/utils/formatters.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:game_review/features/home_screen/review_details.page.dart'; 

class ReviewCard extends StatelessWidget {
  final Review review;
  final VoidCallback? onDetails; 

  const ReviewCard({super.key, required this.review, this.onDetails});

  Widget _starRow(double? rating) {
    final v = (rating ?? 0).clamp(0, 10);
    final filled = (v / 2).round();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        return Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Icon(
            i < filled ? Icons.star : Icons.star_border,
            size: 16,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cover = review.game?.coverImageUrl;
    final gameTitle = review.game?.title ?? review.gameId ?? t.gameDetails.details;
    final excerpt = (review.content ?? '').trim();
    final createdAgo = formatTimeAgo(review.createdAt);
    final username = review.userId ?? 'User';

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
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
                image: cover != null ? DecorationImage(image: NetworkImage(cover), fit: BoxFit.cover) : null,
              ),
              child: cover == null ? const Center(child: Icon(Icons.image, size: 48)) : null,
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: Text(
                    gameTitle,
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
                      MaterialPageRoute(builder: (_) => ReviewDetailsPage(review: review)),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
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
                Expanded(child: Text(username, style: theme.textTheme.bodySmall)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
