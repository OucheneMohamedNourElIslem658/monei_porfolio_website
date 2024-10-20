import 'package:flutter/material.dart';

import '/commun/constents/colors.dart';

class CustomTheme {
  static var lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      surface: CustomColors.blue1,
    ),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: CustomColors.blue1,
      backgroundColor: Colors.transparent
    ),
    outlinedButtonTheme: const OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStatePropertyAll(
          BorderSide(
            color: CustomColors.purple1,
            width: 2
          )
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.zero
          )
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 20, vertical: 15)
        ),
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
      )
    )
  );
}