import 'package:flutter/material.dart';
import 'package:game_review/features/home/models/review.dart';
import 'package:game_review/i18n/strings.g.dart';

class ReviewCard extends StatelessWidget {
  final Review review;
  final VoidCallback? onTap;
  const ReviewCard({super.key, required this.review, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cover = review.game?.coverImageUrl;

    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 160,
          child: Row(
            children: [
              // Cover
              Container(
                width: 140,
                height: double.infinity,
                color: Colors.grey[900],
                child: cover != null
                    ? Image.network(cover, fit: BoxFit.cover)
                    : const Icon(Icons.image, size: 48),
              ),
              // Details
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // title and like icon row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              t.Review,
                              style: theme.textTheme.titleMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(Icons.thumb_up_off_alt, size: 18),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // user and created time
                      Text(
                        'User@${review.userId ?? 'unknown'} • ${review.createdAt != null ? review.createdAt!.toLocal().toString().split(' ')[0] : ''}',
                        style: theme.textTheme.bodySmall,
                      ),
                      const SizedBox(height: 8),
                      // short excerpt of content
                      Expanded(
                        child: Text(
                          review.content ?? '',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
