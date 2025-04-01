import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

const String appFont = "Inter";

TextTheme blackTextTheme = const TextTheme(
  displayLarge: TextStyle(fontSize: 57, color: AppColors.textColorLight),
  displayMedium: TextStyle(fontSize: 45, color: AppColors.textColorLight),
  displaySmall: TextStyle(fontSize: 36, color: AppColors.textColorLight),
  headlineLarge: TextStyle(fontSize: 32, color: AppColors.textColorLight),
  headlineMedium: TextStyle(fontSize: 28, color: AppColors.textColorLight),
  headlineSmall: TextStyle(fontSize: 24, color: AppColors.textColorLight),
  titleLarge: TextStyle(fontSize: 22, color: AppColors.textColorLight),
  titleMedium: TextStyle(fontSize: 16, color: AppColors.textColorLight),
  titleSmall: TextStyle(fontSize: 14, color: AppColors.textColorLight),
  labelLarge: TextStyle(fontSize: 14, color: AppColors.textColorLight),
  labelMedium: TextStyle(fontSize: 12, color: AppColors.textColorLight),
  labelSmall: TextStyle(fontSize: 11, color: AppColors.textColorLight),
  bodyLarge: TextStyle(fontSize: 16, color: AppColors.textColorLight),
  bodyMedium: TextStyle(fontSize: 14, color: AppColors.textColorLight),
  bodySmall: TextStyle(fontSize: 12, color: AppColors.textColorLight),
);
TextTheme simpleTextTheme = const TextTheme(
  displayLarge: TextStyle(fontSize: 57),
  displayMedium: TextStyle(fontSize: 45),
  displaySmall: TextStyle(fontSize: 36),
  headlineLarge: TextStyle(fontSize: 32),
  headlineMedium: TextStyle(fontSize: 28),
  headlineSmall: TextStyle(fontSize: 24),
  titleLarge: TextStyle(fontSize: 22),
  titleMedium: TextStyle(fontSize: 16),
  titleSmall: TextStyle(fontSize: 14),
  labelLarge: TextStyle(fontSize: 14),
  labelMedium: TextStyle(fontSize: 12),
  labelSmall: TextStyle(fontSize: 11),
  bodyLarge: TextStyle(fontSize: 16),
  bodyMedium: TextStyle(fontSize: 14),
  bodySmall: TextStyle(fontSize: 12),
);
TextTheme whiteTextTheme = const TextTheme(
  displayLarge: TextStyle(fontSize: 57, color: AppColors.textColorDark),
  displayMedium: TextStyle(fontSize: 45, color: AppColors.textColorDark),
  displaySmall: TextStyle(fontSize: 36, color: AppColors.textColorDark),
  headlineLarge: TextStyle(fontSize: 22, color: AppColors.textColorDark),
  headlineMedium: TextStyle(fontSize: 28, color: AppColors.textColorDark),
  headlineSmall: TextStyle(fontSize: 24, color: AppColors.textColorDark),
  titleLarge: TextStyle(fontSize: 22, color: AppColors.textColorDark),
  titleMedium: TextStyle(fontSize: 16, color: AppColors.textColorDark),
  titleSmall: TextStyle(fontSize: 14, color: AppColors.textColorDark),
  labelLarge: TextStyle(fontSize: 14, color: AppColors.textColorDark),
  labelMedium: TextStyle(fontSize: 12, color: AppColors.textColorDark),
  labelSmall: TextStyle(fontSize: 11, color: AppColors.textColorDark),
  bodyLarge: TextStyle(fontSize: 16, color: AppColors.textColorDark),
  bodyMedium: TextStyle(fontSize: 14, color: AppColors.textColorDark),
  bodySmall: TextStyle(fontSize: 12, color: AppColors.textColorDark),
);

class CustomTextStyle {
  static TextStyle h22SB = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
  static TextStyle h16SB = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static TextStyle h16M = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle h16R = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle h14M = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle h14R = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle s15B = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );
  static TextStyle s15SB = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
  static TextStyle s15M = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static TextStyle s15R = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static TextStyle s13M = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
  static TextStyle s13R = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
  static TextStyle small12R = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static TextStyle bar10M = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
}
