import 'package:cash_toggar_app/generated/assets.dart';
import 'package:cash_toggar_app/helper/global_widgets/MyResponsiveText.dart';
import 'package:cash_toggar_app/resources/constants.dart';
import 'package:cash_toggar_app/resources/fonts_style.dart';
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../generated/l10n.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/colors_manager.dart';

class MyCustomSliverAppBarForHomeScreen extends StatelessWidget {
  const MyCustomSliverAppBarForHomeScreen({
    super.key,
    required this.sayHelloBasedOnTime,
    required this.userName,
  });

  final String sayHelloBasedOnTime;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            24,
          ),
          bottomRight: Radius.circular(
            24,
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
          child: FittedBox(
            /// TODO Add image here
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: SvgPicture.asset(
                Assets.imagesHorizontalLogoSvg,
                // color: Colors.white,
              ),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyResponsiveText(
              text: sayHelloBasedOnTime == AppConstants.morning
                  ? S.of(context).googMorning
                  : S.of(context).goodAfternoon,
              style: getRegular(
                fontColor: AppColors.myWhite,
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            MyResponsiveText(
              text: userName.toString(),
              style: getSemiBold(
                fontColor: AppColors.secondaryColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      toolbarHeight: MediaQueryValues(context).height * 0.2,
      // toolbarHeight: ,
    );
  }
}

class MyDefaultCustomSliverAppBarScreen extends StatelessWidget {
  const MyDefaultCustomSliverAppBarScreen({
    super.key,
    required this.headerTitle,
    required this.refreshFunction,
    required this.backFunction,
  });

  final String headerTitle;
  final Function refreshFunction;
  final Function backFunction;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            24,
          ),
          bottomRight: Radius.circular(
            24,
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  refreshFunction();
                },
                child: SvgPicture.asset(
                  Assets.iconsRefreshIconSvg,
                  color: AppColors.secondaryColor,
                ),
              ),
              Spacer(),
              MyResponsiveText(
                text: headerTitle,
                style: getSemiBold(
                  fontColor: AppColors.myWhite,
                  fontSize: 24,
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  backFunction();
                },
                child: SvgPicture.asset(
                  Assets.iconsArrowBackIconSvg,
                  color: AppColors.myWhite,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      toolbarHeight: MediaQueryValues(context).height * 0.15,
      // toolbarHeight: ,
    );
  }
}
