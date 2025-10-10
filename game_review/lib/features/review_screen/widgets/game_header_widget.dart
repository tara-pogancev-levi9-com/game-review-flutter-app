import 'package:flutter/material.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/border_size.dart';

class GameHeaderWidget extends StatelessWidget {
  final GameModel game;

  const GameHeaderWidget({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderSize.m.radius,
        child: Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.surfaceVariant,
            borderRadius: BorderSize.m.radius,
          ),
          child: game.coverImageUrl != null
              ? Image.network(
                  game.coverImageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _buildPlaceholder(),
                )
              : _buildPlaceholder(),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return const Center(
      child: Icon(
        Icons.gamepad_rounded,
        size: 64,
        color: AppColors.textSecondary,
      ),
    );
  }
}
