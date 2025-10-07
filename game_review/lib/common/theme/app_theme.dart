import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_fonts.dart';
import 'package:game_review/common/theme/app_typography.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get dark {
    const colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryPurple,
      onPrimary: Colors.white,
      secondary: AppColors.textSecondary,
      onSecondary: Colors.white,
      error: Colors.redAccent,
      onError: Colors.white,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      tertiary: AppColors.surfaceVariant,
      onTertiary: AppColors.textPrimary,
    );

    final base = ThemeData(
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: Colors.transparent,
      canvasColor: AppColors.nearBlack,
      extensions: const <ThemeExtension<dynamic>>[
        AppGradients.dark,
      ],
      fontFamily: AppFonts.roboto,
    );

    return base.copyWith(
      textTheme: base.textTheme
          .apply(
            bodyColor: AppColors.textPrimary,
            displayColor: AppColors.textPrimary,
          )
          .copyWith(
            bodyMedium: base.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              letterSpacing: 0.5,
            ),
            titleLarge: base.textTheme.titleLarge?.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
              letterSpacing: 0.5,
            ),
            headlineSmall: base.textTheme.headlineSmall?.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
              letterSpacing: 0.5,
            ),
            labelMedium: base.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
              letterSpacing: 0.5,
            ),
            bodySmall: base.textTheme.bodySmall?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: AppColors.textSecondary,
              letterSpacing: 0.5,
            ),
          ),

      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.outline,

        selectionColor: AppColors.primaryPurple,
        selectionHandleColor: AppColors.primaryPurple,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: const EdgeInsets.all(16),
        filled: false,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: const BorderSide(color: AppColors.outline, width: 1),
        ),
        hintStyle: const TextStyle(color: AppColors.textSecondary),
        prefixIconColor: AppColors.lilacSelected,
        suffixIconColor: AppColors.lilacSelected,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: const BorderSide(color: AppColors.outline, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: const BorderSide(
            color: AppColors.lilacSelected,
            width: 1.8,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.softWhite,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
          textStyle: AppTypography.buttonLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: AppColors.softWhite, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
          textStyle: AppTypography.buttonLarge,
        ),
      ),
      chipTheme: base.chipTheme.copyWith(
        side: const BorderSide(color: AppColors.outline, width: 1),
        backgroundColor: Colors.transparent,
        labelStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w500,
        ),
      ),
      sliderTheme: base.sliderTheme.copyWith(
        activeTrackColor: AppColors.primaryPurple,
        thumbColor: AppColors.primaryPurple,
        inactiveTrackColor: AppColors.textSecondary.withValues(alpha: 0.25),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
        shape: StadiumBorder(),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primaryPurple,
        linearTrackColor: AppColors.textSecondary,
        circularTrackColor: AppColors.textSecondary,
      ),
      switchTheme: SwitchThemeData(
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryPurple.withValues(alpha: 0.6);
          } else {
            return AppColors.textSecondary.withValues(alpha: 0.3);
          }
        }),
        thumbColor: const WidgetStatePropertyAll(AppColors.primaryPurple),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryPurple;
          } else {
            return AppColors.textSecondary.withValues(alpha: 0.6);
          }
        }),
        checkColor: const WidgetStatePropertyAll(Colors.white),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryPurple;
          } else {
            return AppColors.textSecondary.withValues(alpha: 0.6);
          }
        }),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.lilacSelected,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        showUnselectedLabels: true,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.transparent,
        indicatorColor: AppColors.primaryPurple,
        indicatorShape: StadiumBorder(),
        labelTextStyle: WidgetStatePropertyAll(
          TextStyle(
            color: AppColors.lilacSelected,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: WidgetStatePropertyAll(IconThemeData(color: Colors.white)),
        height: 84,
      ),
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColors.surface,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.outline.withValues(alpha: 0.3),
        thickness: 1,
        space: 1,
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
