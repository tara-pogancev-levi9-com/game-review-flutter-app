import 'package:flutter/material.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_typography.dart';
import 'package:game_review/common/theme/border_size.dart';

class BottomSheetGameCard extends StatelessWidget {
  final GameModel game;
  final VoidCallback onTap;

  const BottomSheetGameCard({
    super.key,
    required this.game,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderSize.m.radius,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Game Cover Image
          Expanded(
            child: ClipRRect(
              borderRadius: BorderSize.m.radius,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  border: Border.all(
                    color: AppColors.outline.withOpacity(0.3),
                    width: 1,
                  ),
                  borderRadius: BorderSize.m.radius,
                ),
                child: game.coverImageUrl != null
                    ? Image.network(
                        game.coverImageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _placeholder(),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return _placeholder();
                        },
                      )
                    : _placeholder(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Game Title
          Text(
            game.title,
            style: AppTypography.gameTitle.copyWith(fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _placeholder() => const Center(
    child: Icon(
      Icons.gamepad_rounded,
      size: 48,
      color: AppColors.textSecondary,
    ),
  );
}
