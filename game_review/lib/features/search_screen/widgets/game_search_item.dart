import 'package:flutter/material.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_typography.dart';
import 'package:game_review/common/theme/border_size.dart';
import 'package:game_review/common/widgets/network_image_widget.dart';
import 'package:game_review/features/library_screen/game_details_page.dart';

class GameSearchItem extends StatelessWidget {
  final GameModel game;

  const GameSearchItem({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => GameDetailsPage(game: game),
          ),
        );
      },
      borderRadius: BorderSize.m.radius,
      child: Container(
        height: 180,
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Game Cover
                ClipRRect(
                  borderRadius: BorderSize.s.radius,
                  child: SizedBox(
                    width: 70,
                    height: 95,
                    child: NetworkImageWidget(
                      imageUrl: game.coverImageUrl,
                      fit: BoxFit.cover,
                      placeholderIconSize: 32,
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Game Title
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        game.title,
                        style: AppTypography.labelSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (game.releaseDate != null) ...[
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_rounded,
                              size: 14,
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "${game.releaseDate!.year}-${game.releaseDate!.month.toString().padLeft(2, '0')}-${game.releaseDate!.day.toString().padLeft(2, '0')}",
                              style: AppTypography.searchItemSubtitle,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),

                // Arrow Icon
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.textSecondary,
                  size: 24,
                ),
              ],
            ),

            const SizedBox(
              height: 8,
            ),

            if (game.platforms != null && game.platforms!.isNotEmpty) ...[
              const Divider(color: AppColors.outline, height: 20),
              Row(
                children: [
                  const Icon(
                    Icons.devices_rounded,
                    size: 16,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      game.platforms!.take(3).join(' • '),
                      style: AppTypography.searchItemSubtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],

            if (game.developer != null || game.publisher != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.business_rounded,
                    size: 16,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      game.developer ?? game.publisher ?? '',
                      style: AppTypography.searchItemSubtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
