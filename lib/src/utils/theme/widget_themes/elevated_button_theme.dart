import 'package:flutter/material.dart';
import 'package:sdg_guess_quest/src/constants/colors.dart';
import 'package:sdg_guess_quest/src/constants/sizes.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._(); //avoid creating instances

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      foregroundColor: whiteColor,
      backgroundColor: secondaryColor,
      side: BorderSide(color: secondaryColor),
      padding: EdgeInsets.symmetric(vertical: buttonHeight),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      foregroundColor: secondaryColor,
      backgroundColor: whiteColor,
      side: BorderSide(color: secondaryColor),
      padding: EdgeInsets.symmetric(vertical: buttonHeight),
    ),
  );
}
