import 'package:cash_toggar_app/generated/assets.dart';
import 'package:cash_toggar_app/helper/global_widgets/MyResponsiveText.dart';
import 'package:cash_toggar_app/helper/global_widgets/my_default_button.dart';
import 'package:cash_toggar_app/helper/global_widgets/my_text_butoon.dart';
import 'package:cash_toggar_app/helper/global_widgets/sliver_widgets/custom_sliver_app_bar.dart';
import 'package:cash_toggar_app/helper/local/cache_helper.dart';
import 'package:cash_toggar_app/helper/local/cache_helper_keys.dart';
import 'package:cash_toggar_app/modules/bottom_nav_modules/home/controller/home_cubit.dart';
import 'package:cash_toggar_app/modules/bottom_nav_modules/home/view/home_widgets.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cash_toggar_app/resources/constants.dart';
import 'package:cash_toggar_app/resources/fonts_style.dart';
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../generated/l10n.dart';
import '../../../../helper/global_widgets/transaction_card/transaction_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context)
        .getUserData(CacheHelper.getData(key: CacheHelperKeys.uId));
    BlocProvider.of<HomeCubit>(context)
        .getUserMoneyRecords(CacheHelper.getData(key: CacheHelperKeys.uId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var homeCubit = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
          body: homeCubit.getUserDataLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
              : CustomScrollView(
                  slivers: [
                    MyCustomSliverAppBarForHomeScreen(
                      sayHelloBasedOnTime: AppConstants.night,
                      userName:
                          "${homeCubit.userModel.firstName} ${homeCubit.userModel.lastName}",
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            MainCardInHomeScreen(
                              totalAmount:
                                  homeCubit.userModel.myCash.toString(),
                              totalCashBack:
                                  homeCubit.userModel.myPoints.toString(),
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
                                    function: () {
                                      homeCubit.navigateToChoosePaymentMethod(
                                        context: context,
                                        value: true,
                                      );
                                    },
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
                                    function: () {
                                      homeCubit.navigateToChoosePaymentMethod(
                                        context: context,
                                        value: false,
                                      );
                                    },
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
                                      fontColor: AppColors.secondaryColor,
                                      fontSize: 16),
                                  function: () {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            homeCubit.allRecords.isEmpty
                                ? Center(
                                    child: MyResponsiveText(
                                      text: "There is no data at this time",
                                      style: getBold(
                                          fontColor: AppColors.primaryColor,
                                          fontSize: 16),
                                      maxLines: 4,
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: homeCubit.allRecords.length >= 5
                                        ? 5
                                        : homeCubit.allRecords.length,
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2),
                                        child: TransactionCard(
                                          userName: homeCubit
                                              .allRecords[index].userName,
                                          transactionDate: "09/01/2025 - ",
                                          transactionTime: "07:54:45",
                                          transactionAmount: homeCubit
                                              .allRecords[index].amount,
                                          transactionGateway: homeCubit
                                              .allRecords[index].paymentMethod,
                                          paymentStatusEnum: homeCubit
                                              .allRecords[index].status,
                                          isSendingMoneyMakeItGreen: homeCubit
                                              .allRecords[index].isSendingMoney,
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
      },
    );
  }
}
