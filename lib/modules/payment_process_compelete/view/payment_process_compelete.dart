import 'package:cash_toggar_app/helper/global_widgets/MyResponsiveText.dart';
import 'package:cash_toggar_app/modules/payment_process_compelete/view/widgets.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cash_toggar_app/resources/fonts_style.dart';
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../helper/global_widgets/my_default_button.dart';
import '../../../helper/global_widgets/sliver_widgets/custom_sliver_app_bar.dart';
import '../../../helper/localization/cubit/localization_cubit.dart';
import '../../bottom_nav_modules/home/controller/home_cubit.dart';
import '../controller/payment_process_compelete_cubit.dart';

class PaymentProcessCompleteScreen extends StatelessWidget {
  const PaymentProcessCompleteScreen({super.key});

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
                                        SizedBox(
                                          height:
                                              MediaQueryValues(context).height *
                                                  0.12,
                                          width:
                                              MediaQueryValues(context).width *
                                                  0.27,
                                          child: Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    paymentProcessCompleteCubit
                                                        .currentPaymentWayImage,
                                                  ),
                                                  MyResponsiveText(
                                                    textDirection:
                                                        localCubit.isArabic()
                                                            ? TextDirection.rtl
                                                            : TextDirection.ltr,
                                                    text: paymentProcessCompleteCubit
                                                        .currentPaymentWayName,
                                                    style: getSemiBold(
                                                      fontColor: AppColors
                                                          .primaryColor,
                                                      fontSize: 14,
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
                                        MyResponsiveText(
                                          textAlign: TextAlign.center,
                                          maxLines: 10,
                                          text: S
                                              .of(context)
                                              .alertMessageWhenCreateRequest,
                                          style: getBold(
                                            fontColor: AppColors.secondaryColor,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Row(
                                          children: [
                                            MyResponsiveText(
                                              text: " : رقم فودافون كاش",
                                              style: getSemiBold(
                                                fontColor: AppColors.myBlack,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            MyDefaultButtonFit(
                                              text: "01011224455",
                                              textSize: 16,
                                              function: () {},
                                              borderRadius: 4.0,
                                              backGroundColor: Color(
                                                0xffEFEFEF,
                                              ),
                                              textColor:
                                                  AppColors.secondaryColor,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),

                                        Row(
                                          children: [
                                            MyResponsiveText(
                                              text: "المبلغ",
                                              style: getSemiBold(
                                                fontColor: AppColors.myBlack,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: MediaQueryValues(context)
                                                      .height *
                                                  0.06,
                                              width: MediaQueryValues(context)
                                                      .width *
                                                  0.32,
                                              child: CustomTextField(
                                                hintText: '15.00',
                                                textEditingController:
                                                    paymentProcessCompleteCubit
                                                        .priceController,
                                                textInputType:
                                                    TextInputType.number,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: MyResponsiveText(
                                            textAlign: localCubit.isArabic()
                                                ? TextAlign.right
                                                : TextAlign.left,
                                            text:
                                                "الحد الأدني 15LE - الحد الأقصي 30,000LE",
                                            style: getSemiBold(
                                              fontColor:
                                                  AppColors.myBlack.withOpacity(
                                                0.4,
                                              ),
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 16,
                                        ),

                                        Row(
                                          children: [
                                            MyResponsiveText(
                                              text: "رقم الهاتف",
                                              style: getSemiBold(
                                                fontColor: AppColors.myBlack,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: MediaQueryValues(context)
                                                      .height *
                                                  0.06,
                                              width: MediaQueryValues(context)
                                                      .width *
                                                  0.6,
                                              child: CustomTextField(
                                                hintText:
                                                    'رقم الهاتف الذي تم التحويل منه',
                                                textEditingController:
                                                    paymentProcessCompleteCubit
                                                        .phoneController,
                                                textInputType:
                                                    TextInputType.phone,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: MyResponsiveText(
                                            textAlign: localCubit.isArabic()
                                                ? TextAlign.right
                                                : TextAlign.left,
                                            text:
                                                "رقم الهاتف الذي تم التحويل منه",
                                            style: getSemiBold(
                                              fontColor:
                                                  AppColors.myBlack.withOpacity(
                                                0.4,
                                              ),
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 16,
                                        ),

                                        Row(
                                          children: [
                                            MyResponsiveText(
                                              text:
                                                  "إسكرين شوت لعملية تحويل ناجحة",
                                              style: getSemiBold(
                                                fontColor: AppColors.myBlack,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: MediaQueryValues(context)
                                                      .width *
                                                  0.6,
                                              height: MediaQueryValues(context)
                                                      .height *
                                                  0.06,
                                              decoration: BoxDecoration(
                                                color: Color(
                                                  0xffEFEFEF,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  4,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  MyResponsiveText(
                                                    text: "رفع إسكرين شوت هنا",
                                                    style: getSemiBold(
                                                      fontColor:
                                                          AppColors.myBlack,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 16.0,
                                                  ),
                                                  SvgPicture.asset(
                                                    "assets/icons/screen_shot_svg_icon.svg",
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 16,
                                        ),

                                        MyDefaultButton(
                                          text: S.of(context).confirm,
                                          textSize: 18,
                                          function: () {
                                            paymentProcessCompleteCubit.navigateToPaymentConfirmationScreen(context: context,);
                                          },
                                          backGroundColor: AppColors.secondaryColor,
                                        ),
                                        // CustomTextField(),
                                      ],
                                    ),
                                  ),
                                ),

                              ),
                              SizedBox(
                                height: 100,
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
