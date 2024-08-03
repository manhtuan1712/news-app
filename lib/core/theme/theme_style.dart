import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_constants.dart';
import 'package:news_app/core/theme/app_colors.dart';

class ThemeStyle {
  // ---------- Dark Theme ---------- //
  static ThemeData get darkTheme {
    return ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.color724FFF,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppConstants.text16Regular.copyWith(
          color: AppColors.colorEBEBF5.withOpacity(
            0.6,
          ),
        ),
        errorStyle: AppConstants.text14Regular.copyWith(
          color: AppColors.colorFF2D2D,
        ),
        errorMaxLines: 2,
        isDense: true,
        isCollapsed: true,
      ),
      splashFactory: NoSplash.splashFactory,
      brightness: Brightness.dark,
      primaryColor: AppColors.color7000FF,
      scaffoldBackgroundColor: Colors.black,
      fontFamily: AppConstants.defaultFont,
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(
          AppColors.color7000FF,
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            2.0,
          ),
        ),
      ),
      // Dialog Theme
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.color1C1C1E,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12.0,
        ),
      ),
      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(
          Colors.white,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(
            WidgetState.selected,
          )
              ? AppColors.color7000FF
              : null,
        ),
      ),
      useMaterial3: true,
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return null;
            }
            if (states.contains(WidgetState.selected)) {
              return AppColors.color7000FF;
            }
            return null;
          },
        ),
      ),
    );
  }

  // ---------- Light Theme ---------- //
  static ThemeData get lightTheme {
    return ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.color7000FF,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppConstants.text16Regular.copyWith(
          color: AppColors.color818A99,
        ),
        errorStyle: AppConstants.text14Regular.copyWith(
          color: AppColors.colorFF2D2D,
        ),
        errorMaxLines: 2,
        isDense: true,
        isCollapsed: true,
      ),
      splashFactory: NoSplash.splashFactory,
      brightness: Brightness.light,
      primaryColor: AppColors.color7000FF,
      scaffoldBackgroundColor: AppColors.colorF5F5F5,
      fontFamily: AppConstants.defaultFont,
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(
          AppColors.color7000FF,
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            2.0,
          ),
        ),
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 12.0,
        ),
      ),
      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(
          Colors.black,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? AppColors.color7000FF
              : null,
        ),
      ),
      useMaterial3: true,
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return null;
            }
            if (states.contains(WidgetState.selected)) {
              return AppColors.color7000FF;
            }
            return null;
          },
        ),
      ),
    );
  }
}
