import 'package:flutter/material.dart';
import 'package:sdg_guess_quest/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:sdg_guess_quest/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:sdg_guess_quest/src/utils/theme/widget_themes/text_theme.dart';

class AppTheme {
  AppTheme._(); //make constructor private so user can't access our theme with an instance of this class
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    // primarySwatch: const MaterialColor(0xFFFFE200, <int, Color>{
    //   50: Color(0x1AFFE200),
    //   100: Color(0x33FFE200),
    //   200: Color(0x4DFFE200),
    //   300: Color(0x66FFE200),
    //   400: Color(0x80FFE200),
    //   500: Color(0xFFFFE200),
    //   600: Color(0x99FFE200),
    //   700: Color(0xB3FFE200),
    //   800: Color(0xCCFFE200),
    //   900: Color(0xE6FFE200),
    // }), //could doo TextStyle()
    textTheme: AppTextTheme.lightTextTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: AppTextTheme.darkTextTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
  );
}
