import 'package:flutter/material.dart';
import 'package:game_review/common/extensions/datetime_extensions.dart';
import 'package:game_review/common/models/models.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_theme.dart';
import 'package:game_review/core/services/review_service.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:get_it/get_it.dart';

class ReviewsSectionWidget extends StatefulWidget {
  final String gameId;

  const ReviewsSectionWidget({
    super.key,
    required this.gameId,
  });

  @override
  State<ReviewsSectionWidget> createState() => _ReviewsSectionWidgetState();
}

class _ReviewsSectionWidgetState extends State<ReviewsSectionWidget> {
  final ReviewService _reviewService = GetIt.instance<ReviewService>();
  List<GameReview> _reviews = [];
  bool _isLoading = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _loadReviews();
  }

  Future<void> _loadReviews() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      final reviews = await _reviewService.getGameReviews(
        widget.gameId,
        limit: 5,
      );
      setState(() {
        _reviews = reviews;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppTheme.paddingMedium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                t.gameDetails.recentReviews,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else if (_hasError)
            Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: AppColors.textSecondary,
                    size: 48,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    t.errors.failedToFetchGameReviews,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: _loadReviews,
                    child: Text(t.gameDetails.retry),
                  ),
                ],
              ),
            )
          else if (_reviews.isEmpty)
            Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.reviews_outlined,
                    color: AppColors.textSecondary,
                    size: 48,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    t.gameDetails.noReviews,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _reviews.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final review = _reviews[index];
                return _buildReviewCard(context, review);
              },
            ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(BuildContext context, GameReview review) {
    return Container(
      padding: AppTheme.paddingLarge,
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: AppTheme.borderRadiusMedium,
        border: Border.all(
          color: AppColors.outline.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.outline.withValues(alpha: 0.3),
                child: const Text(
                  'U',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.gameDetails.unknownUser,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (review.overallRating != null)
                      Row(
                        children: [
                          ...List.generate(5, (index) {
                            return Icon(
                              index < (review.overallRating! / 2).round()
                                  ? Icons.star
                                  : Icons.star_border,
                              color: AppColors.lilacSelected,
                              size: 16,
                            );
                          }),
                          const SizedBox(width: 8),
                          Text(
                            '${review.overallRating!.toStringAsFixed(1)}/10',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),

              Text(
                review.createdAt?.relativeTime ?? '',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          if (review.title != null && review.title!.isNotEmpty)
            Text(
              review.title!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),

          const SizedBox(height: 8),

          if (review.content != null && review.content!.isNotEmpty)
            Text(
              review.content!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textPrimary,
                height: 1.4,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),

          const SizedBox(height: 12),

          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                  color: AppColors.lilacSelected,
                  size: 20,
                ),
                onPressed: () {
                  // TODO: Implement like functionality
                },
              ),
              Text(
                '0',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(
                  Icons.comment_outlined,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
                onPressed: () {
                  // TODO: Navigate to review details
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
