import 'package:cash_toggar_app/helper/global_vars.dart';
import 'package:cash_toggar_app/helper/localization/cubit/localization_cubit.dart';
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  /// if it true that's mean put money in the my wallet

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocalizationCubit, LocalizationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var localizationCubit = BlocProvider.of<LocalizationCubit>(context);
        return Directionality(
          textDirection: localizationCubit.isArabic()
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Card(
            child: Container(
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
                              Expanded(
                                flex: 3,
                                child: MyResponsiveText(
                                  textAlign: localizationCubit.isArabic()
                                      ? TextAlign.left
                                      : TextAlign.right,
                                  textDirection: localizationCubit.isArabic()
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  text: isSendingMoneyMakeItGreen
                                      ? "+${transactionAmount}"
                                      : "-${transactionAmount}",
                                  style: getSemiBold(
                                    fontColor: isSendingMoneyMakeItGreen
                                        ? AppColors.inf_suc_dan_warn_sucess
                                        : AppColors.inf_suc_dan_warn_danger,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 6,
                                child: MyResponsiveText(
                                  textAlign: localizationCubit.isArabic()
                                      ? TextAlign.right
                                      : TextAlign.left,
                                  textDirection: localizationCubit.isArabic()
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  text:
                                      putTheTitleForTheTransactionBasedOnTheStatusAndOnTheSendingOrNotMoney(
                                    isSendingMoney: isSendingMoneyMakeItGreen,
                                    status: paymentStatusEnum,
                                    context: context,
                                  ),
                                  style: getSemiBold(
                                    fontColor: AppColors.myBlack,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: MyResponsiveText(
                                  text: transactionGateway,
                                  style: getSemiBold(
                                    fontColor:
                                        AppColors.inf_suc_dan_warn_sucess,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                flex: 4,
                                child: MyResponsiveText(
                                  textDirection: localizationCubit.isArabic()
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  text:
                                      "${S.current.day} $transactionDate - $transactionTime",
                                  style: getSemiBold(
                                    fontColor: AppColors.myBlack,
                                    fontSize: 12,
                                  ),
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
                            : paymentStatusEnum ==
                                    AppConstants.failedTransaction
                                ? Assets.iconsRejectedRequestIconSvg
                                : Assets.iconsPendingRequestIconSvg,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

String putTheTitleForTheTransactionBasedOnTheStatusAndOnTheSendingOrNotMoney({
  required bool isSendingMoney,
  required String status,
  required BuildContext context,
}) {
  if (status == AppConstants.pendingTransaction) {
    return S.of(context).transactionPending;
  } else if (status == AppConstants.successTransaction) {
    if (isSendingMoney) {
      return S.of(context).depositSuccessful;
    } else {
      return S.of(context).withdrawalSuccessful;
    }
  } else {
    if (isSendingMoney) {
      return S.of(context).depositRejected;
    } else {
      return S.of(context).withdrawalRejected;
    }
  }
}
