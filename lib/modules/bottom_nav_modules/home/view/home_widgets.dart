import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../../helper/global_widgets/MyResponsiveText.dart';
import '../../../../helper/global_widgets/my_default_button.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/fonts_style.dart';

class MainCardInHomeScreen extends StatelessWidget {
  const MainCardInHomeScreen({
    super.key,
    required this.totalAmount,
    required this.totalCashBack,
  });

  final String totalAmount;
  final String totalCashBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQueryValues(context).height * 0.22,
      width: MediaQueryValues(context).width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.gradientStartColor,
          AppColors.gradientEndColor
        ], stops: [
          0.0,
          0.5,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(
          16.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: MyResponsiveText(
                      text: S.of(context).myCurrentMoney,
                      style: getSemiBold(
                        fontColor: AppColors.secondaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyResponsiveText(
                      text: "$totalAmount LE",
                      style: getBold(
                        fontColor: AppColors.myWhite,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQueryValues(context).width * 0.4,
                    child: MyDefaultButtonFitWithIcon(

                      text: "Cash Back $totalCashBack LE",
                      textSize: 16,
                      function: () {},
                      backGroundColor: AppColors.myWhite,
                      textColor: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),



            SizedBox(
              width: 6,
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.iconsRefreshIconSvg,
                    ),
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    Assets.iconsTransactionIconSvg,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
