import 'package:cash_toggar_app/generated/assets.dart';
import 'package:cash_toggar_app/helper/global_widgets/MyResponsiveText.dart';
import 'package:cash_toggar_app/helper/global_widgets/my_default_button.dart';
import 'package:cash_toggar_app/helper/global_widgets/my_text_butoon.dart';
import 'package:cash_toggar_app/helper/global_widgets/sliver_widgets/custom_sliver_app_bar.dart';
import 'package:cash_toggar_app/modules/bottom_nav_modules/home/view/home_widgets.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cash_toggar_app/resources/constants.dart';
import 'package:cash_toggar_app/resources/fonts_style.dart';
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../generated/l10n.dart';
import '../../../../helper/global_widgets/transaction_card/transaction_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MyCustomSliverAppBarForHomeScreen(
            sayHelloBasedOnTime: AppConstants.night,
            userName: "Mohamed Elkerm",
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  MainCardInHomeScreen(
                    totalAmount: '1500',
                    totalCashBack: '586',
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyDefaultButton(
                          text: S.of(context).sendingMoney,
                          textSize: 24,
                          function: () {},
                          isLarge: true,
                          textColor: AppColors.myWhite,
                          backGroundColor: AppColors.secondaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: MyDefaultButton(
                          text: S.of(context).receiveMoney,
                          textSize: 24,
                          function: () {},
                          isLarge: true,
                          textColor: AppColors.primaryColor,
                          backGroundColor: AppColors.myWhite,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      MyResponsiveText(
                        text: S.of(context).transActionHistory,
                        style: getSemiBold(
                          fontColor: AppColors.myBlack,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      MyTextButton(
                        text: S.of(context).seeAll,
                        style: getSemiBold(
                            fontColor: AppColors.secondaryColor, fontSize: 16),
                        function: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ListView.builder(
                    itemCount: 8,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: TransactionCard(
                          userName: "محمد أحمد محمود",
                          transactionDate: "09/01/2025 - ",
                          transactionTime: "07:54:45",
                          transactionAmount: "5,000",
                          transactionGateway: "Vodafone Cash",
                          paymentStatusEnum: AppConstants.successTransaction,
                          isSendingMoneyMakeItGreen: true,
                        ),
                      );
                    },
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
