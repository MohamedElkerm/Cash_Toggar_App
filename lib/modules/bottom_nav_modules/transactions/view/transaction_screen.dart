import 'package:cash_toggar_app/helper/global_widgets/sliver_widgets/custom_sliver_app_bar.dart';
import 'package:cash_toggar_app/modules/bottom_nav_modules/home/controller/home_cubit.dart';
import 'package:cash_toggar_app/modules/bottom_nav_modules/home/controller/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../../helper/global_widgets/MyResponsiveText.dart';
import '../../../../helper/global_widgets/transaction_card/transaction_card.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/constants.dart';
import '../../../../resources/fonts_style.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var homeCubit = BlocProvider.of<HomeCubit>(context);
          return CustomScrollView(
            slivers: [
              MyDefaultCustomSliverAppBarScreen(
                headerTitle: S
                    .of(context)
                    .transActionHistory,
                refreshFunction: () {},
                backFunction: () {},
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
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
                        itemCount: homeCubit.allRecords.length,
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
          );
        },
      ),
    );
  }
}
