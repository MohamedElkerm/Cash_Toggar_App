import 'package:cash_toggar_app/helper/global_widgets/MyResponsiveText.dart';
import 'package:cash_toggar_app/helper/global_widgets/my_default_button.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cash_toggar_app/resources/fonts_style.dart';
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../helper/global_widgets/sliver_widgets/custom_sliver_app_bar.dart';
import '../../../helper/localization/cubit/localization_cubit.dart';
import '../../bottom_nav_modules/home/controller/home_cubit.dart';
import '../../payment_process_compelete/controller/payment_process_compelete_cubit.dart';

class ConfirmationRequestScreen extends StatelessWidget {
  const ConfirmationRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PaymentProcessCompeleteCubit,
          PaymentProcessCompeleteState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var paymentProcessCompleteCubit =
              BlocProvider.of<PaymentProcessCompeleteCubit>(context);
          return BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var homeCubit = BlocProvider.of<HomeCubit>(context);
              return CustomScrollView(
                slivers: [
                  MyDefaultCustomSliverAppBarScreen(
                    headerTitle: '',
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
                            children: [
                              SizedBox(
                                width: MediaQueryValues(context).width,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      16.0,
                                    ),
                                    child: Column(
                                      children: [
                                        MyResponsiveText(
                                          text: S
                                              .of(context)
                                              .alertHeaderSendRequestDone,
                                          style: getBold(
                                            fontColor: AppColors.secondaryColor,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        MyResponsiveText(
                                          maxLines: 4,
                                          text: S
                                              .of(context)
                                              .alertBodySendRequestDone,
                                          style: getSemiBold(
                                            fontColor: AppColors.myBlack,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        MyResponsiveText(
                                          maxLines: 4,
                                          text: S
                                              .of(context)
                                              .alertBodySendRequestDone2,
                                          style: getSemiBold(
                                            fontColor: AppColors.myBlack,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              MyDefaultButton(
                                text: S.of(context).backToHome,
                                textSize: 16,
                                function: () {
                                  paymentProcessCompleteCubit
                                      .navigateToHomeScreen(
                                    context: context,
                                  );
                                },
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
          );
        },
      ),
    );
  }
}
