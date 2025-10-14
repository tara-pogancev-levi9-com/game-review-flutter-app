import 'package:flutter/material.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_typography.dart';
import 'package:game_review/common/theme/border_size.dart';
import 'package:game_review/common/widgets/network_image_widget.dart';
import 'package:game_review/features/library_screen/game_details_page.dart';

class GameCard extends StatelessWidget {
  final GameModel game;
  final VoidCallback? onTap;

  const GameCard({
    super.key,
    required this.game,
    this.onTap,
  });

  void _handleTap(BuildContext context) {
    if (onTap != null) {
      onTap!();
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => GameDetailsPage(game: game),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTap(context),
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderSize.m.radius,
                child: Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceVariant,
                    border: Border.all(
                      color: AppColors.outline.withOpacity(0.2),
                      width: 1,
                    ),
                    borderRadius: BorderSize.m.radius,
                  ),
                  child: NetworkImageWidget(
                    imageUrl: game.coverImageUrl,
                    fit: BoxFit.cover,
                    placeholderIconSize: 48,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                game.title,
                style: AppTypography.gameTitle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
