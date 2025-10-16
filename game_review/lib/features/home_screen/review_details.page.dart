import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/models/review_model.dart';
import 'package:game_review/features/home_screen/bloc/review_details_cubit.dart';
import 'package:game_review/features/home_screen/bloc/review_details_state.dart';
import 'package:game_review/i18n/strings.g.dart';

import 'utils/formatters.dart';
import 'widgets/comments_section.dart';
import 'widgets/media_thumb.dart';
import 'widgets/rating_row.dart';
import 'widgets/review_chip.dart';

class ReviewDetailsPage extends StatefulWidget {
  final ReviewModel review;

  const ReviewDetailsPage({super.key, required this.review});

  @override
  State<ReviewDetailsPage> createState() => _ReviewDetailsPageState();
}

class _ReviewDetailsPageState extends State<ReviewDetailsPage> {
  @override
  void initState() {
    super.initState();
    locator<ReviewDetailsCubit>().loadReviewMedia(widget.review.id);
  }

  @override
  Widget build(BuildContext context) {
    final cover = widget.review.game?.coverImageUrl;
    final gameTitle = widget.review.game?.title ?? widget.review.gameId;
    final reviewer = widget.review.userId;
    final reviewTitle = widget.review.title;
    final content = widget.review.content;

    const likesCount = 0;

    return BlocConsumer<ReviewDetailsCubit, ReviewDetailsState>(
      bloc: locator<ReviewDetailsCubit>(),
      listener: (context, state) {},
      builder: (context, state) {
        return state.when(
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (reviewMedia) {
            return Scaffold(
              extendBodyBehindAppBar: false,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(64),
                child: SafeArea(
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).maybePop(),
                    ),
                    title: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 2),
                        Icon(Icons.pets, size: 26),
                      ],
                    ),
                  ),
                ),
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
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
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
                          widget.review.createdAt?.timeAgo ?? '',
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
                        Text(
                          reviewer,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        ReviewChip(
                          '${widget.review.playtimeHours ?? 0} ${t.playingRecord}',
                          icon: Icons.schedule,
                        ),
                        ReviewChip(
                          widget.review.completionStatus ?? '-',
                          icon: Icons.check_circle_outline,
                        ),
                        ReviewChip(
                          widget.review.recommended == true
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
                      style:
                          Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        RatingRow(
                          label: t.overall,
                          value: widget.review.overallRating,
                        ),
                        RatingRow(
                          label: t.gameplay,
                          value: widget.review.gameplayRating,
                        ),
                        RatingRow(
                          label: t.graphics,
                          value: widget.review.graphicsRating,
                        ),
                        RatingRow(
                          label: t.story,
                          value: widget.review.storyRating,
                        ),
                        RatingRow(
                          label: t.sound,
                          value: widget.review.soundRating,
                        ),
                        RatingRow(
                          label: t.value,
                          value: widget.review.valueRating,
                        ),
                      ],
                    ),
                  ),

                  // evaluation (pros/cons)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Text(
                      t.evaluation,
                      style:
                          Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  if (widget.review.pros != null &&
                      widget.review.pros!.isNotEmpty)
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
                            widget.review.pros!.toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  if (widget.review.cons != null &&
                      widget.review.cons!.isNotEmpty)
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
                            widget.review.cons!.toString(),
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
                      style:
                          Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.0,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: reviewMedia.length,
                      itemBuilder: (context, index) {
                        final mediaItem = reviewMedia[index];
                        return GestureDetector(
                          onTap: () {
                            _showImagePopup(context, mediaItem.mediaUrl);
                          },
                          child: MediaThumb(image: mediaItem),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: CommentsSection(reviewId: widget.review.id),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showImagePopup(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.contain,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close, color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }
}
