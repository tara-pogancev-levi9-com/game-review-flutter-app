import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/i18n/strings.g.dart';

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
    return AppBar(
      //backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: !isHome
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.textPrimary,
                size: 28,
              ),
              onPressed: onBack ?? () => Navigator.pop(context),
            )
          : null,
      title: Image.asset(
        isHome
            ? 'lib/common/assets/icons/LogoHome.png'
            : 'lib/common/assets/icons/LogoForeground.png',
        height: isHome ? 48 : 36,
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.language,
            color: AppColors.textPrimary,
            size: 28,
          ),
          onPressed: () {
            if (LocaleSettings.currentLocale == AppLocale.en) {
              LocaleSettings.setLocale(AppLocale.sr);
            } else {
              LocaleSettings.setLocale(AppLocale.en);
            }
          },
          tooltip: context.t.changeLanguage,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);
}