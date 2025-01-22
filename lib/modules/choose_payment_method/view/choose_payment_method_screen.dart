import 'package:cash_toggar_app/generated/assets.dart';
import 'package:cash_toggar_app/helper/global_widgets/MyResponsiveText.dart';
import 'package:cash_toggar_app/helper/global_widgets/my_default_button.dart';
import 'package:cash_toggar_app/helper/localization/cubit/localization_cubit.dart';
import 'package:cash_toggar_app/modules/bottom_nav_modules/home/controller/home_cubit.dart';
import 'package:cash_toggar_app/modules/choose_payment_method/view/widgets.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cash_toggar_app/resources/fonts_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../generated/l10n.dart';
import '../../../helper/global_widgets/sliver_widgets/custom_sliver_app_bar.dart';
import '../../payment_process_compelete/controller/payment_process_compelete_cubit.dart';

class ChoosePaymentMethodScreen extends StatelessWidget {
  const ChoosePaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentProcessCompeleteCubit,
        PaymentProcessCompeleteState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var paymentProcessCubit =
            BlocProvider.of<PaymentProcessCompeleteCubit>(context);
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
                    headerTitle: homeCubit.isSendingProcess
                        ? S.of(context).sendingMoneyProcess
                        : S.of(context).receiveMoneyProcess,
                    refreshFunction: () {},
                    backFunction: () {},
                  ),
                  BlocConsumer<LocalizationCubit, LocalizationState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      var localCubit =
                          BlocProvider.of<LocalizationCubit>(context);
                      return SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: localCubit.isArabic()
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  MyResponsiveText(
                                    text: S.of(context).refillMyAccount,
                                    style: getSemiBold(
                                      fontColor: AppColors.myBlack,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  MyDefaultButtonFit(
                                    text: "4587947",
                                    textSize: 16,
                                    function: () {},
                                    borderRadius: 34.0,
                                    backGroundColor: AppColors.myWhite,
                                    textColor: AppColors.secondaryColor,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              MyResponsiveText(
                                text: homeCubit.isSendingProcess
                                    ? S
                                        .of(context)
                                        .chooseYourBestGatewayForeSendingMoney
                                    : S
                                        .of(context)
                                        .chooseYourBestGatewayForeReceiveMoney,
                                style: getSemiBold(
                                  fontColor: AppColors.myBlack,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              MyResponsiveText(
                                text: S.of(context).currentGateway,
                                style: getBold(
                                  fontColor: AppColors.myBlack,
                                  fontSize: 24,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              GridView.builder(
                                padding: EdgeInsets.zero,
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 13,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  // mainAxisExtent: ,
                                ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      paymentProcessCubit
                                          .navigateToPaymentProcessCompleteScreen(
                                        context: context,
                                        currentPaymentWayNameNewValue: "Etisalat Cash",
                                        currentPaymentWayImageNewValue: "assets/images/e_sample.png",
                                      );
                                    },
                                    child: PaymentCardWidget(
                                      paymentName: "Etisalat Cash",
                                      paymentLogo:
                                          "assets/images/e_sample.png",
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 84,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
