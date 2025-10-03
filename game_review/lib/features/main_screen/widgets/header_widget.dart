import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;
  final VoidCallback? onBack;

  const CustomHeader({
    super.key,
    required this.isHome,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (!isHome) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.textPrimary,
                    size: 28,
                  ),
                  onPressed: onBack ?? () => Navigator.pop(context),
                ),
              ),
              Image.asset(
                'lib/common/assets/icons/LogoForeground.png',
                height: 36,
              ),
            ] else ...[
              Image.asset(
                'lib/common/assets/icons/LogoHome.png',
                height: 48,
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);
}
