import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';
import 'package:atraksion_nazorati/src/config/theme/text_styles.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = FlexColorScheme(
  useMaterial3: true,
  primary: AppColors.mainColorDark1,
  onPrimary: AppColors.buttonColorLight,
  background: AppColors.mainColorLight,
  surface: AppColors.mainColorLight,
  brightness: Brightness.light,
  tertiary: AppColors.mainColorDark,
  onTertiary: AppColors.profileContainerColor,
  primaryContainer: AppColors.homeCircleShapeBgColorLight,
  typography: Typography(
    white: whiteTextTheme,
    black: blackTextTheme,
  ),
  textTheme: simpleTextTheme,
).toTheme;

ThemeData darkTheme = FlexColorScheme(
  useMaterial3: true,
  brightness: Brightness.dark,
  background: AppColors.mainColorDark,
  surface: AppColors.mainColorDark,
  primary: AppColors.mainColorDark1,
  onPrimary: AppColors.buttonColorDark,
  tertiary: AppColors.mainColorLight,
  onTertiary: AppColors.profileContainerColor,
  primaryContainer: AppColors.homeCircleShapeBgColorDark,
  typography: Typography(
    white: whiteTextTheme,
    black: blackTextTheme,
  ),
  textTheme: simpleTextTheme,
).toTheme;

List<BoxShadow> baseBoxShadows = [
  BoxShadow(
    color: const Color(0xffa3a3a3).withOpacity(.06),
    offset: const Offset(0, .11),
    blurRadius: 4,
    spreadRadius: 0,
  ),
  BoxShadow(
    color: const Color(0xffa3a3a3).withOpacity(.1),
    offset: const Offset(0, .27),
    blurRadius: 6,
    spreadRadius: 0,
  ),
];
