import 'package:cash_toggar_app/generated/assets.dart';
import 'package:cash_toggar_app/helper/global_widgets/MyResponsiveText.dart';
import 'package:cash_toggar_app/resources/fonts_style.dart';
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/colors_manager.dart';

import 'package:flutter/material.dart';

class MyDefaultButton extends StatelessWidget {
  const MyDefaultButton({
    super.key,
    required this.text,
    this.textColor = AppColors.myWhite,
    required this.textSize,
    this.backGroundColor = AppColors.primaryColor,
    required this.function,
    this.isLarge = false,
    this.isLoading = false,
    this.disabled = false,
    this.loadingColor = AppColors.myWhite,
  });

  final String text;
  final Color textColor;
  final Color backGroundColor;
  final Color loadingColor;
  final double textSize;
  final Function function;
  final bool isLarge;
  final bool isLoading;
  final bool  disabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: isLarge
          ? MediaQuery.of(context).size.height * 0.1
          : MediaQuery.of(context).size.height * 0.08,
      child: ElevatedButton(
        onPressed:disabled?null: isLoading ? null : () => function(), // Disable button when loading
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(
            disabled?AppColors.myGrey: backGroundColor,
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(
          color: loadingColor, // Customize loading indicator color
        )
            : Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: textSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
class MyDefaultButtonWithoutTapping extends StatelessWidget {
  const MyDefaultButtonWithoutTapping({
    super.key,
    required this.text,
    this.textColor = AppColors.myWhite,
    required this.textSize,
    this.backGroundColor = AppColors.primaryColor,
    this.isLarge = false,
  });

  final String text;
  final Color textColor;
  final Color backGroundColor;
  final double textSize;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQueryValues(context).width,
      height: isLarge
          ? MediaQueryValues(context).height * 0.1
          : MediaQueryValues(context).height * 0.08,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              blurRadius: 6, // Spread of the shadow
              offset: Offset(0, 3), // Shadow position (x, y)
            ),
          ],
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
    this.haveIcon = true,
    this.borderRadius = 8.0,
  });

  final String text;
  final Color textColor;
  final Color backGroundColor;
  final double textSize;
  final Function function;
  final bool isLargeCard;
  final double borderRadius;
  final bool haveIcon;

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
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            backGroundColor,
          ),
        ),
        child: Row(
          children: [
            MyResponsiveText(
              text: text,
              style: getBold(
                fontColor: textColor,
                fontSize: textSize,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            SvgPicture.asset(
              Assets.iconsCopyIconSvg,
            ),
          ],
        ),
      ),
    );
  }
}

class MyDefaultButtonFitWithIcon extends StatelessWidget {
  const MyDefaultButtonFitWithIcon({
    super.key,
    required this.text,
    this.textColor = AppColors.myWhite,
    required this.textSize,
    this.backGroundColor = AppColors.primaryColor,
    required this.function,
    this.isLargeCard = false,
    this.haveIcon = true,
    this.borderRadius = 8.0,
  });

  final String text;
  final Color textColor;
  final Color backGroundColor;
  final double textSize;
  final Function function;
  final bool isLargeCard;
  final double borderRadius;
  final bool haveIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQueryValues(context).height * 0.04,
      child: ElevatedButton(
        onPressed: () {
          function();
        },
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            backGroundColor,
          ),
        ),
        child: haveIcon
            ? Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: MyResponsiveText(
                      text: text,
                      style: getBold(
                        fontColor: textColor,
                        fontSize: textSize,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(
                      Assets.iconsCopyIconSvg,
                    ),
                  ),
                ],
              )
            : MyResponsiveText(
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
