import 'package:flutter/material.dart';
import 'app_colors.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.white,
    primary: AppColors.primary,
    background: AppColors.primary,
    surface: Colors.red,
  ),
  dialogTheme: dialogTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  useMaterial3: true,
  fontFamily: 'Inter',
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
  ),
);

final dialogTheme = DialogTheme(
  backgroundColor: AppColors.modalBackgroundColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0),
  ),
);
