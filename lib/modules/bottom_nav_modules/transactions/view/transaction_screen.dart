import 'package:cash_toggar_app/helper/global_widgets/sliver_widgets/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../helper/global_widgets/transaction_card/transaction_card.dart';
import '../../../../resources/constants.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MyDefaultCustomSliverAppBarScreen(
            headerTitle: S.of(context).transActionHistory,
            refreshFunction: () {},
            backFunction: () {},
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
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
