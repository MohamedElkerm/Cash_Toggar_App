import 'package:cash_toggar_app/helper/global_vars.dart';
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/constants.dart';
import '../../../resources/fonts_style.dart';
import '../MyResponsiveText.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.userName,
    required this.transactionDate,
    required this.transactionTime,
    required this.transactionAmount,
    required this.transactionGateway,
    required this.paymentStatusEnum,
    required this.isSendingMoneyMakeItGreen,
  });

  final String userName;
  final String transactionDate;
  final String transactionTime;
  final String transactionAmount;
  final String transactionGateway;

  final String paymentStatusEnum;
  final bool isSendingMoneyMakeItGreen;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: MediaQueryValues(context).height * 0.08,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        MyResponsiveText(
                          text: isSendingMoneyMakeItGreen ? "+${transactionAmount}" : "-${transactionAmount}",
                          style: getSemiBold(
                            fontColor:isSendingMoneyMakeItGreen? AppColors.inf_suc_dan_warn_sucess : AppColors.inf_suc_dan_warn_danger,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        MyResponsiveText(
                          text: userName,
                          style: getSemiBold(
                            fontColor: AppColors.myBlack,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyResponsiveText(
                          text: transactionGateway,
                          style: getSemiBold(
                            fontColor: AppColors.inf_suc_dan_warn_sucess,
                            fontSize: 12,
                          ),
                        ),
                        Spacer(),
                        MyResponsiveText(
                          text: "${S.current.day} $transactionDate - $transactionTime",
                          style: getSemiBold(
                            fontColor: AppColors.myBlack,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  paymentStatusEnum == AppConstants.successTransaction
                      ? Assets.iconsSuccessRequestIconSvg
                      : paymentStatusEnum == AppConstants.failedTransaction
                          ? Assets.iconsRejectedRequestIconSvg
                          : Assets.iconsPendingRequestIconSvg,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
