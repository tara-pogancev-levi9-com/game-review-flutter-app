import 'package:flutter/material.dart';
import 'package:game_review/common/models/review_model.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/features/main_screen/widgets/header_widget.dart';
import 'package:game_review/i18n/strings.g.dart';

import 'utils/formatters.dart';
import 'widgets/comments_section.dart';
import 'widgets/media_thumb.dart';
import 'widgets/rating_row.dart';
import 'widgets/review_chip.dart';

class ReviewDetailsPage extends StatelessWidget {
  final ReviewModel review;

  const ReviewDetailsPage({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final cover = review.game?.coverImageUrl;
    final gameTitle = review.game?.title ?? review.gameId;
    final reviewer = review.userId;
    final reviewTitle = review.title;
    final content = review.content;

    const likesCount = 0;

    // Get the gradient from theme
    final gradients =
        Theme.of(context).extension<AppGradients>() ?? AppGradients.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: gradients.background,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: false,
        appBar: CustomHeader(
          isHome: false,
          onBack: () => Navigator.of(context).pop(),
        ),
        body: ListView(
          padding: const EdgeInsets.only(bottom: 24),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  Text(
                    t.gameDetails.details,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      // TODO: like action
                    },
                    icon: const Icon(Icons.thumb_up_outlined),
                  ),
                ],
              ),
            ),
            // cover
            Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              height: 180,
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
                  ? const Center(child: Icon(Icons.image, size: 48))
                  : null,
            ),
            // game title, reviewer, date
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      gameTitle,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    review.createdAt?.timeAgo ?? '',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: Row(
                children: [
                  const Icon(Icons.person, size: 16),
                  const SizedBox(width: 8),
                  Text(reviewer, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),

            // review title & content
            if (reviewTitle != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                child: Text(
                  reviewTitle,
                  style:
                      Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            if (content != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  content,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),

            // chips
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Wrap(
                spacing: 8,
                runSpacing: 6,
                children: [
                  ReviewChip(
                    '${review.playtimeHours ?? 0} ${t.playingRecord}',
                    icon: Icons.schedule,
                  ),
                  ReviewChip(
                    review.completionStatus ?? '-',
                    icon: Icons.check_circle_outline,
                  ),
                  ReviewChip(
                    review.recommended == true
                        ? t.wouldRecommend
                        : t.wouldNotRecommend,
                    icon: Icons.thumb_up,
                  ),
                  ReviewChip(
                    '$likesCount ${t.likes}',
                    icon: Icons.favorite_outline,
                  ),
                  // Comments count in CommentsSection / CommentsChip inside that widget
                ],
              ),
            ),

            // ratings header + rows
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                t.ratings,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  RatingRow(label: t.overall, value: review.overallRating),
                  RatingRow(label: t.gameplay, value: review.gameplayRating),
                  RatingRow(label: t.graphics, value: review.graphicsRating),
                  RatingRow(label: t.story, value: review.storyRating),
                  RatingRow(label: t.sound, value: review.soundRating),
                  RatingRow(label: t.value, value: review.valueRating),
                ],
              ),
            ),

            // evaluation (pros/cons)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                t.evaluation,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            if (review.pros != null && review.pros!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.check_circle_outline),
                        const SizedBox(width: 8),
                        Text(
                          t.pros,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      review.pros!.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            if (review.cons != null && review.cons!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.block_outlined),
                        const SizedBox(width: 8),
                        Text(
                          t.cons,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      review.cons!.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),

            // media
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text(
                t.media,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Row(
                children: [
                  MediaThumb(),
                  SizedBox(width: 8),
                  MediaThumb(),
                  SizedBox(width: 8),
                  MediaThumb(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: CommentsSection(reviewId: review.id),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
