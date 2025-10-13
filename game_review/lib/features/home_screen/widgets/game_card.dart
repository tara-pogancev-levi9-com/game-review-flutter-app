import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/widgets/network_image_widget.dart';
import 'package:game_review/features/search_screen/search_page.dart';
import 'package:game_review/features/welcome_screen/welcome_page.dart';
import 'package:game_review/common/theme/app_typography.dart';
import 'package:game_review/common/theme/border_size.dart';

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
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchPage(), //replace with GameDetails page
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderSize.m.radius,
            onTap: () => _handleTap(context),

            child: ClipRRect(
              borderRadius: BorderSize.m.radius,
              child: Container(
                height: 180,
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
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              game.title,
              style: AppTypography.gameTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
