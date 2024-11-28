import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData mealAppLightTheme(
      ColorScheme lightColorScheme, currentTextStyle) {
    return ThemeData(
      useMaterial3: true,
    ).copyWith(
      colorScheme: lightColorScheme,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        color: lightColorScheme.primary,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: currentTextStyle.copyWith(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      scaffoldBackgroundColor: lightColorScheme.surface,
      iconTheme: const IconThemeData(color: Colors.white),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: lightColorScheme.primary,
        selectedItemColor: Colors.white,
        unselectedLabelStyle: currentTextStyle.copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        selectedLabelStyle: currentTextStyle.copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      textTheme: createTextTheme(currentTextStyle, Colors.white),
    );
  }

  static ThemeData mealAppDarkTheme(
      ColorScheme darkColorScheme, currentTextStyle) {
    return ThemeData(
      useMaterial3: true,
    ).copyWith(
      colorScheme: darkColorScheme,
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        color: darkColorScheme.primaryContainer,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: currentTextStyle.copyWith(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      scaffoldBackgroundColor: darkColorScheme.surface,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkColorScheme.primaryContainer,
        selectedItemColor: Colors.white,
        unselectedLabelStyle: currentTextStyle.copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        selectedLabelStyle: currentTextStyle.copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      textTheme: createTextTheme(
        currentTextStyle,
        Colors.white,
      ),
    );
  }

  static createTextTheme(TextStyle baseStyle, Color textColour) {
    return TextTheme(
      titleLarge: baseStyle.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: textColour,
      ),
      titleMedium: baseStyle.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: textColour,
      ),
      titleSmall: baseStyle.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: textColour,
      ),
      labelLarge: baseStyle.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: textColour,
      ),
      labelMedium: baseStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: textColour,
      ),
      labelSmall: baseStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: textColour,
      ),
      bodySmall: baseStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textColour,
      ),
    );
  }
}
