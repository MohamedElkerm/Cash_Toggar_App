 import 'package:flutter/material.dart';

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.bold;
}

TextStyle getCustomTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getBold({required fontColor, required double fontSize}) {
  return TextStyle(
    fontWeight: FontWeightManager.bold,
    color: fontColor,
    fontSize: fontSize,
  );
}

TextStyle getSemiBold({required fontColor, required double fontSize}) {
  return TextStyle(
    fontWeight: FontWeightManager.semiBold,
    color: fontColor,
    fontSize: fontSize,
  );
}

TextStyle getRegular({required fontColor, required double fontSize}) {
  return TextStyle(
    fontWeight: FontWeightManager.regular,
    color: fontColor,
    fontSize: fontSize,
  );
}

TextStyle getLight({required fontColor, required double fontSize}) {
  return TextStyle(
    fontWeight: FontWeightManager.light,
    color: fontColor,
    fontSize: fontSize,
  );
}
