import 'package:flutter/material.dart';

import '../colors_manager.dart';

ThemeData lightTheme() {
  return ThemeData(
    fontFamily: "Cairo",
    scaffoldBackgroundColor: AppColors.b_w_25,

    indicatorColor: Colors.red,


useMaterial3: false,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      elevation: 0.0,
    ),
  );
}
