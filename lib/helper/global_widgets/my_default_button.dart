import 'package:cash_toggar_app/helper/global_widgets/MyResponsiveText.dart';
import 'package:cash_toggar_app/resources/fonts_style.dart';
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../resources/colors_manager.dart';

class MyDefaultButton extends StatelessWidget {
  const MyDefaultButton({
    super.key,
    required this.text,
    this.textColor = AppColors.myWhite,
    required this.textSize,
    this.backGroundColor = AppColors.primaryColor,
    required this.function,
  });

  final String text;
  final Color textColor;
  final Color backGroundColor;
  final double textSize;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQueryValues(context).width,
      height: MediaQueryValues(context).height * 0.06,
      child: ElevatedButton(
        onPressed: () {
          function();
        },
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            backGroundColor,
          ),
        ),
        child: MyResponsiveText(
          text: text,
          style: getBold(
            fontColor: textColor,
            fontSize: textSize,
          ),
        ),
      ),
    );
  }
}

class MyDefaultButtonFit extends StatelessWidget {
  const MyDefaultButtonFit({
    super.key,
    required this.text,
    this.textColor = AppColors.myWhite,
    required this.textSize,
    this.backGroundColor = AppColors.primaryColor,
    required this.function,
    this.isLargeCard = false,
  });

  final String text;
  final Color textColor;
  final Color backGroundColor;
  final double textSize;
  final Function function;
  final bool isLargeCard;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isLargeCard
          ? MediaQueryValues(context).height * 0.1
          : MediaQueryValues(context).height * 0.04,
      child: ElevatedButton(
        onPressed: () {
          function();
        },
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            backGroundColor,
          ),
        ),
        child: MyResponsiveText(
          text: text,
          style: getBold(
            fontColor: textColor,
            fontSize: textSize,
          ),
        ),
      ),
    );
  }
}
