import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'constants.dart';

class AppTheme {
  static const TextStyle darkText = TextStyle(
    color: AppColors.whiteGrey,
    fontFamily: Constants.primaryFont,
  );

  static const TextStyle lightText = TextStyle(
    color: AppColors.black,
    fontFamily: Constants.primaryFont,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.blue,
    appBarTheme: const AppBarTheme(
      toolbarTextStyle: darkText,
    ),
    textTheme: const TextTheme(
      bodySmall: darkText,
      bodyLarge: darkText,
      bodyMedium: darkText,
      labelMedium: darkText,
      labelSmall: darkText,
      labelLarge: darkText,
    ),
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
      background: AppColors.black,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.blue,
    appBarTheme: const AppBarTheme(
      toolbarTextStyle: lightText,
    ),
    textTheme: const TextTheme(
      bodySmall: lightText,
      bodyLarge: lightText,
      bodyMedium: lightText,
      labelMedium: lightText,
      labelSmall: lightText,
      labelLarge: lightText,
    ),
    scaffoldBackgroundColor: AppColors.lightGrey,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
      background: AppColors.whiteGrey,
    ),
  );
}
