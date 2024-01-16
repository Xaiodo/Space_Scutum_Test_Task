import 'package:flutter/material.dart';
import 'app_colors.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.white,
    primary: AppColors.primary,
    background: AppColors.backgroundColor,
  ),
  dialogTheme: dialogTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  textTheme: textTheme,
  useMaterial3: true,
  fontFamily: 'Inter',
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.black,
    selectionColor: AppColors.black,
    selectionHandleColor: AppColors.black,
  ),
);

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    foregroundColor: AppColors.black,
    backgroundColor: AppColors.backgroundColor,
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(
        color: AppColors.black,
        width: 1,
      ),
    ),
    visualDensity: const VisualDensity(
      horizontal: 0,
      vertical: -4,
    ),
  ),
);

final dialogTheme = DialogTheme(
  backgroundColor: AppColors.modalBackgroundColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0),
  ),
);

const textTheme = TextTheme(
  headlineMedium: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  ),
  bodyLarge: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  ),
);
