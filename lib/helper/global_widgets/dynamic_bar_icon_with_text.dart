import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/colors_manager.dart';
import '../../resources/fonts_style.dart';
import 'MyResponsiveText.dart';

class DynamicBarIconWithText extends StatelessWidget {
  const DynamicBarIconWithText({
    super.key,
    required this.title,
    required this.iconName,
  });

  final String title;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: MyResponsiveText(
            text:title,
            style: getBold(
              fontColor: AppColors.primary_700_main,
              fontSize: 21,
            ),
          ),
        ),
        SvgPicture.asset(
          iconName,
          color: AppColors.primary_700_main,
          height: 30,
        ),
      ],
    );
  }
}

class DynamicBarTextWithoutIcon extends StatelessWidget {
  const DynamicBarTextWithoutIcon({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return MyResponsiveText(
      text:title,
      style: getBold(
        fontColor: AppColors.primary_700_main,
        fontSize: 20,
      ),
    );
  }
}
