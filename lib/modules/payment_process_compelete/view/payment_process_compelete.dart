import 'package:cash_toggar_app/helper/global_widgets/MyResponsiveText.dart';
import 'package:cash_toggar_app/helper/validator/phone_number_validator.dart';
import 'package:cash_toggar_app/helper/validator/price_validator.dart';
import 'package:cash_toggar_app/main_cubit/cubit/main_cubit.dart';
import 'package:cash_toggar_app/modules/choose_payment_method/view/widgets.dart';
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
import '../../../helper/local/cache_helper.dart';
import '../../../helper/local/cache_helper_keys.dart';
import '../../../helper/localization/cubit/localization_cubit.dart';
import '../../../helper/validator/instapay_account_validator.dart';
import '../../bottom_nav_modules/home/controller/home_cubit.dart';
import '../controller/payment_process_compelete_cubit.dart';

class PaymentProcessCompleteScreen extends StatefulWidget {
  const PaymentProcessCompleteScreen({super.key});

  @override
  State<PaymentProcessCompleteScreen> createState() =>
      _PaymentProcessCompleteScreenState();
}

class _PaymentProcessCompleteScreenState
    extends State<PaymentProcessCompleteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<PaymentProcessCompeleteCubit>(context)
        .priceController
        .clear();
    BlocProvider.of<PaymentProcessCompeleteCubit>(context)
        .phoneController
        .clear();
    super.initState();
  }

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
              return Form(
                key: paymentProcessCompleteCubit.formKeyGlobalKey,
                child: CustomScrollView(
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
                                          homeCubit.isSendingProcess
                                              ? SizedBox()
                                              : MyResponsiveText(
                                                  textAlign: TextAlign.center,
                                                  maxLines: 10,
                                                  text:
                                                      "${S.of(context).withdrawFundsVia} ${localCubit.isArabic() ? paymentProcessCompleteCubit.currentPaymentGateWay.title : paymentProcessCompleteCubit.currentPaymentGateWay.titleEn}",
                                                  style: getBold(
                                                    fontColor: AppColors
                                                        .secondaryColor,
                                                    fontSize: 16,
                                                  ),
                                                ),

                                          SizedBox(
                                            height: 16,
                                          ),
                                          SizedBox(
                                            // height:
                                            //     MediaQueryValues(context).height *
                                            //         0.12,
                                            width: MediaQueryValues(context)
                                                    .width *
                                                0.27,
                                            child: PaymentCardWidget(
                                              paymentName: localCubit.isArabic()
                                                  ? paymentProcessCompleteCubit
                                                      .currentPaymentGateWay
                                                      .title
                                                  : paymentProcessCompleteCubit
                                                      .currentPaymentGateWay
                                                      .titleEn,
                                              paymentLogo:
                                                  paymentProcessCompleteCubit
                                                      .currentPaymentGateWay
                                                      .image,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          homeCubit.isSendingProcess
                                              ? MyResponsiveText(
                                                  textAlign: TextAlign.center,
                                                  maxLines: 10,
                                                  text: S
                                                      .of(context)
                                                      .alertMessageWhenCreateRequest,
                                                  style: getBold(
                                                    fontColor: AppColors
                                                        .secondaryColor,
                                                    fontSize: 16,
                                                  ),
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          homeCubit.isSendingProcess
                                              ? Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: MyResponsiveText(
                                                        textDirection:
                                                            localCubit
                                                                    .isArabic()
                                                                ? TextDirection
                                                                    .rtl
                                                                : TextDirection
                                                                    .ltr,
                                                        textAlign: localCubit
                                                                .isArabic()
                                                            ? TextAlign.right
                                                            : TextAlign.left,
                                                        text: localCubit
                                                                .isArabic()
                                                            ? paymentProcessCompleteCubit
                                                                .currentPaymentGateWay
                                                                .titleForTransaction
                                                            : paymentProcessCompleteCubit
                                                                .currentPaymentGateWay
                                                                .titleForTransactionEn,
                                                        style: getSemiBold(
                                                          fontColor:
                                                              AppColors.myBlack,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child:
                                                          MyDefaultButtonFitWithIcon(
                                                        haveIcon: false,
                                                        text: paymentProcessCompleteCubit
                                                            .currentPaymentGateWay
                                                            .transactionMethod,
                                                        textSize: 16,
                                                        function: () {
                                                          homeCubit
                                                              .copyToClipboard(
                                                            context,
                                                            paymentProcessCompleteCubit
                                                                .currentPaymentGateWay
                                                                .transactionMethod,
                                                            localCubit
                                                                .isArabic(),
                                                          );
                                                        },
                                                        borderRadius: 4.0,
                                                        backGroundColor: Color(
                                                          0xffEFEFEF,
                                                        ),
                                                        textColor: AppColors
                                                            .secondaryColor,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: 16,
                                          ),

                                          SizedBox(
                                            width: double.infinity,
                                            child: MyResponsiveText(
                                              textDirection:
                                                  localCubit.isArabic()
                                                      ? TextDirection.rtl
                                                      : TextDirection.ltr,
                                              textAlign: localCubit.isArabic()
                                                  ? TextAlign.right
                                                  : TextAlign.left,
                                              text: S.of(context).moneyRange,
                                              style: getSemiBold(
                                                fontColor: AppColors.myBlack
                                                    .withOpacity(
                                                  0.4,
                                                ),
                                                fontSize: 12,
                                              ),
                                              maxLines: 10,
                                            ),
                                          ),

                                          SizedBox(
                                            height: 4,
                                          ),

                                          Row(
                                            children: [
                                              Expanded(
                                                child: MyResponsiveText(
                                                  textAlign:
                                                      localCubit.isArabic()
                                                          ? TextAlign.right
                                                          : TextAlign.left,
                                                  text: S.of(context).amount,
                                                  style: getSemiBold(
                                                    fontColor:
                                                        AppColors.myBlack,
                                                    fontSize: 16,
                                                  ),
                                                  textDirection:
                                                      localCubit.isArabic()
                                                          ? TextDirection.rtl
                                                          : TextDirection.ltr,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  width:
                                                      MediaQueryValues(context)
                                                              .width *
                                                          0.32,
                                                  child: CustomTextField(
                                                    validator: priceValidator,
                                                    hintText: '15.00',
                                                    textEditingController:
                                                        paymentProcessCompleteCubit
                                                            .priceController,
                                                    textInputType:
                                                        TextInputType.number,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(
                                            height: 16,
                                          ),

                                          /// I think here is error Error

                                          SizedBox(
                                            width: double.infinity,
                                            child: MyResponsiveText(
                                              maxLines: 2,
                                              textDirection:
                                                  localCubit.isArabic()
                                                      ? TextDirection.rtl
                                                      : TextDirection.ltr,
                                              textAlign: localCubit.isArabic()
                                                  ? TextAlign.right
                                                  : TextAlign.left,
                                              text: homeCubit.isSendingProcess
                                                  ? S
                                                      .of(context)
                                                      .phoneNumberThatSendingMoney
                                                  : S
                                                      .of(context)
                                                      .phoneNumberThatReceivingMoney,
                                              style: getSemiBold(
                                                fontColor: AppColors.myBlack
                                                    .withOpacity(
                                                  0.4,
                                                ),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),

                                          SizedBox(
                                            height: 4,
                                          ),

                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: MyResponsiveText(
                                                  textAlign:
                                                      localCubit.isArabic()
                                                          ? TextAlign.right
                                                          : TextAlign.left,
                                                  text: paymentProcessCompleteCubit
                                                              .currentPaymentGateWay
                                                              .titleEn ==
                                                          "Instapay"
                                                      ? S
                                                          .of(context)
                                                          .instapayAddress
                                                      : S
                                                          .of(context)
                                                          .phoneNumber,
                                                  style: getSemiBold(
                                                    fontColor:
                                                        AppColors.myBlack,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: SizedBox(
                                                  // height:
                                                  //     MediaQueryValues(context)
                                                  //             .height *
                                                  //         0.1,
                                                  width:
                                                      MediaQueryValues(context)
                                                              .width *
                                                          0.52,
                                                  child: CustomTextField(
                                                    hintText: paymentProcessCompleteCubit
                                                                .currentPaymentGateWay
                                                                .titleEn ==
                                                            "Instapay"
                                                        ? S
                                                            .of(context)
                                                            .instapayAddressUser
                                                        : homeCubit
                                                                .isSendingProcess
                                                            ? S
                                                                .of(context)
                                                                .phoneNumberThatSendingMoney
                                                            : S
                                                                .of(context)
                                                                .phoneNumberThatReceivingMoney,
                                                    textEditingController:
                                                        paymentProcessCompleteCubit
                                                            .phoneController,
                                                    textInputType:
                                                        paymentProcessCompleteCubit
                                                                    .currentPaymentGateWay
                                                                    .titleEn ==
                                                                "Instapay"
                                                            ? TextInputType.text
                                                            : TextInputType
                                                                .phone,
                                                    validator: paymentProcessCompleteCubit
                                                                .currentPaymentGateWay
                                                                .titleEn ==
                                                            "Instapay"
                                                        ? instapayAccountValidator
                                                        : phoneNumberValidator,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(
                                            height: 16,
                                          ),

                                          homeCubit.isSendingProcess
                                              ? Row(
                                                  children: [
                                                    MyResponsiveText(
                                                      textDirection: localCubit
                                                              .isArabic()
                                                          ? TextDirection.rtl
                                                          : TextDirection.ltr,
                                                      textAlign:
                                                          localCubit.isArabic()
                                                              ? TextAlign.right
                                                              : TextAlign.left,
                                                      text: S
                                                          .of(context)
                                                          .screenshotOfTransaction,
                                                      style: getSemiBold(
                                                        fontColor:
                                                            AppColors.myBlack,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox(),

                                          SizedBox(
                                            height: 8,
                                          ),
                                          homeCubit.isSendingProcess
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: MediaQueryValues(
                                                                  context)
                                                              .width *
                                                          0.6,
                                                      height: MediaQueryValues(
                                                                  context)
                                                              .height *
                                                          0.06,
                                                      decoration: BoxDecoration(
                                                        color: Color(
                                                          0xffEFEFEF,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          4,
                                                        ),
                                                      ),
                                                      child: InkWell(
                                                        onTap: () {
                                                          paymentProcessCompleteCubit
                                                              .pickAndCompressImage(
                                                            context: context,
                                                          );
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              flex: 5,
                                                              child:
                                                                  MyResponsiveText(
                                                                text: S
                                                                    .of(context)
                                                                    .uploadTheImage,
                                                                style:
                                                                    getSemiBold(
                                                                  fontColor:
                                                                      AppColors
                                                                          .myBlack,
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 16.0,
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: SvgPicture
                                                                  .asset(
                                                                "assets/icons/screen_shot_svg_icon.svg",
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox(),

                                          SizedBox(
                                            height: 16,
                                          ),

                                          BlocConsumer<MainCubit, MainState>(
                                            listener: (context, state) {
                                              // TODO: implement listener
                                            },
                                            builder: (context, state) {
                                              return MyDefaultButton(
                                                isLoading: homeCubit
                                                        .isSendingProcess
                                                    ? paymentProcessCompleteCubit
                                                        .sendSendingMoneyLoading
                                                    : paymentProcessCompleteCubit
                                                        .sendReceivingMoneyLoading,
                                                text: S.of(context).confirm,
                                                textSize: 18,
                                                function: () {
                                                  homeCubit.isSendingProcess
                                                      ? BlocProvider.of<
                                                                  MainCubit>(
                                                              context)
                                                          .startImageUpload()
                                                      : null;

                                                  homeCubit.isSendingProcess
                                                      ? paymentProcessCompleteCubit
                                                          .sendSendingMoneyRecord(
                                                          uId: homeCubit
                                                              .userModel.uId,
                                                          userId: homeCubit
                                                              .userModel.userId,
                                                          userName:
                                                              "${homeCubit.userModel.firstName} ${homeCubit.userModel.lastName}",
                                                          email: homeCubit
                                                              .userModel.email,
                                                          context: context,
                                                          isArabic: localCubit
                                                              .isArabic(),
                                                        )
                                                          .then((value) {
                                                          homeCubit
                                                              .getUserMoneyRecords(
                                                            CacheHelper.getData(
                                                              key:
                                                                  CacheHelperKeys
                                                                      .uId,
                                                            ),
                                                          );
                                                        })
                                                      : paymentProcessCompleteCubit
                                                          .sendReceivingMoneyRecord(
                                                          uId: homeCubit
                                                              .userModel.uId,
                                                          userId: homeCubit
                                                              .userModel.userId,
                                                          userName:
                                                              "${homeCubit.userModel.firstName} ${homeCubit.userModel.lastName}",
                                                          email: homeCubit
                                                              .userModel.email,
                                                          context: context,
                                                          isArabic: localCubit
                                                              .isArabic(),
                                                          userWallet: homeCubit
                                                              .userModel.myCash,
                                                        )
                                                          .then((value) {
                                                          homeCubit
                                                              .getUserMoneyRecords(
                                                            CacheHelper.getData(
                                                              key:
                                                                  CacheHelperKeys
                                                                      .uId,
                                                            ),
                                                          );
                                                        });
                                                },
                                                backGroundColor:
                                                    AppColors.secondaryColor,
                                              );
                                            },
                                          ),
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}
