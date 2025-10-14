// lib/features/home_screen/widgets/game_card.dart
import 'package:flutter/material.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_typography.dart';
import 'package:game_review/common/theme/border_size.dart';
import 'package:game_review/common/widgets/network_image_widget.dart';
import 'package:game_review/features/game_details/game_details_page.dart';

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
          builder: (_) => GameDetailsPage(
            gameId: game.id,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTap(context),
      child: SizedBox(
        width: 150, // Fiksna širina
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // DODAJ OVO
          children: [
            // Game Cover - BEZ Expanded
            ClipRRect(
              borderRadius: BorderSize.m.radius,
              child: Container(
                height: 200, // Fiksna visina
                width: 150, // Fiksna širina
                color: AppColors.surfaceVariant,
                child: NetworkImageWidget(
                  imageUrl: game.coverImageUrl,
                  fit: BoxFit.cover,
                  placeholderIconSize: 48,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Game Title - Fiksna visina
            SizedBox(
              height: 40,
              child: Padding(
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
            ),
          ],
        ),
      ),
    );
  }
}
