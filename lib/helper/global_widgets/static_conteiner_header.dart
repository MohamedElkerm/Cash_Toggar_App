import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../generated/assets.dart';
import '../../resources/colors_manager.dart';

class StaticContainerHeader extends StatelessWidget {
  const StaticContainerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQueryValues(context).height * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          // bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          Assets.imagesVerticalLogoSvg,
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
