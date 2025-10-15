import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/models/models.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_theme.dart';
import 'package:game_review/features/game_details/bloc/game_details_cubit.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:game_review/common/extensions/datetime_extensions.dart';

enum GameMenuAction {
  wishlist('wishlist'),
  library('library'),
  review('review'),
  share('share');

  const GameMenuAction(this.value);
  final String value;
}

class GameContentWidget extends StatelessWidget {
  final GameModel game;
  final String gameId;
  final bool isInWishlist;
  final bool isInLibrary;

  const GameContentWidget({
    super.key,
    required this.game,
    required this.gameId,
    required this.isInWishlist,
    required this.isInLibrary,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.paddingMedium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  game.title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              PopupMenuButton<String>(
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColors.textPrimary,
                  size: 24,
                ),
                color: AppColors.surfaceVariant,
                shape: RoundedRectangleBorder(
                  borderRadius: AppTheme.borderRadiusMedium,
                ),
                onSelected: (value) => _handleMenuAction(context, value),
                itemBuilder: (context) => [
                  PopupMenuItem<String>(
                    value: GameMenuAction.wishlist.value,
                    child: Row(
                      children: [
                        Icon(
                          isInWishlist ? Icons.favorite : Icons.favorite_border,
                          color: AppColors.lilacSelected,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          isInWishlist
                              ? t.gameDetails.removeFromWishlist
                              : t.gameDetails.addToWishlist,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: GameMenuAction.library.value,
                    child: Row(
                      children: [
                        Icon(
                          isInLibrary
                              ? Icons.remove_circle_outline
                              : Icons.library_add,
                          color: AppColors.lilacSelected,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          isInLibrary
                              ? t.actions.removeFromLibrary
                              : t.actions.addToLibrary,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: GameMenuAction.review.value,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.rate_review,
                          color: AppColors.lilacSelected,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          t.actions.writeReview,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: GameMenuAction.share.value,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.share,
                          color: AppColors.lilacSelected,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          t.actions.shareGame,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          if (game.genres != null && game.genres!.isNotEmpty) ...[
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: game.genres!.map((genre) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.outline),
                    borderRadius: AppTheme.borderRadiusMedium,
                  ),
                  child: Text(
                    genre,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
          ],

          Text(
            t.overall,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                t.gameDetails.overallRecommendation.replaceAll(
                  '{percentage}',
                  '99',
                ),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              const Icon(
                Icons.sentiment_very_satisfied,
                color: AppColors.textPrimary,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 16),

          if (game.description != null && game.description!.isNotEmpty) ...[
            Text(
              game.description!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
          ],

          Text(
            t.details,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          if (game.developer != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.gameDetails.developer,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  game.developer!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.lilacSelected,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],

          if (game.publisher != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.gameDetails.publisher,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  game.publisher!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.lilacSelected,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],

          if (game.releaseDate != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.gameDetails.released,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  game.releaseDate!.formattedDate,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.lilacSelected,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],

          if (game.platforms != null && game.platforms!.isNotEmpty) ...[
            Text(
              t.gameDetails.availableOn,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: game.platforms!.map((platform) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.outline),
                    borderRadius: AppTheme.borderRadiusMedium,
                  ),
                  child: Text(
                    platform,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
          ],
        ],
      ),
    );
  }

  void _showComingSoonSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _handleMenuAction(BuildContext context, String action) {
    final cubit = context.read<GameDetailsCubit>();

    switch (action) {
      case 'wishlist':
        cubit.toggleWishlist(gameId);
        break;
      case 'library':
        cubit.toggleLibrary(gameId);
        break;
      case 'review':
        break;
      case 'share':
        // TODO: Implement share functionality
        _showComingSoonSnackBar(context, t.gameDetails.shareComingSoon);
        break;
    }
  }
}
