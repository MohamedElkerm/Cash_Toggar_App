import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../resources/colors_manager.dart';
import '../../resources/fonts_style.dart';
import 'MyResponsiveText.dart';

myGlobalSnackBarWidget({
  required context,
  required isArabic,
  required backGroundColor,
  required text,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backGroundColor,
      content: MyResponsiveText(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        textAlign: isArabic ? TextAlign.right : TextAlign.left,
        text: text,
        style: getSemiBold(
          fontColor: AppColors.myWhite,
          fontSize: 16,
        ),
      ),
    ),
  );
}
