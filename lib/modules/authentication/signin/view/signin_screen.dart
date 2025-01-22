import 'package:cash_toggar_app/generated/assets.dart';
import 'package:cash_toggar_app/helper/global_widgets/MyResponsiveText.dart';
import 'package:cash_toggar_app/helper/global_widgets/my_default_button.dart';
import 'package:cash_toggar_app/helper/global_widgets/my_text_butoon.dart';
import 'package:cash_toggar_app/helper/global_widgets/my_text_form_field.dart';
import 'package:cash_toggar_app/helper/global_widgets/static_conteiner_header.dart';
import 'package:cash_toggar_app/helper/global_widgets/transaction_card/transaction_card.dart';
import 'package:cash_toggar_app/helper/localization/cubit/localization_cubit.dart';
import 'package:cash_toggar_app/modules/authentication/signin/controller/signin_cubit.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cash_toggar_app/resources/constants.dart';
import 'package:cash_toggar_app/resources/fonts_style.dart';
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../generated/l10n.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(),
      child: BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var signInCubit = BlocProvider.of<SigninCubit>(context);
          return BlocConsumer<LocalizationCubit, LocalizationState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var localCubit = BlocProvider.of<LocalizationCubit>(context);
              return Scaffold(
                body: Directionality(
                  textDirection:localCubit.isArabic()? TextDirection.rtl : TextDirection.ltr,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        StaticContainerHeader(),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: MyResponsiveText(
                                  text: S.of(context).signIn,
                                  style: getBold(
                                    fontColor: AppColors.primaryColor,
                                    fontSize: 26,
                                  ),
                                  textAlign: localCubit.isArabic()? TextAlign.right : TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              MyTextFormField(
                                hintText: S.of(context).enterEmail,
                                label: S.of(context).email,
                                textEditingController:
                                    signInCubit.emailController,
                                isPassword: false,
                                isHidden: false,
                                textInputType: TextInputType.emailAddress,
                                prefixIcon: Assets.iconsUserIconSvg,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              MyTextFormField(
                                hintText: S.of(context).enterPassword,
                                label: S.of(context).password,
                                textEditingController:
                                    signInCubit.passwordController,
                                isPassword: true,
                                isHidden: !signInCubit.isVisibile,
                                textInputType: TextInputType.visiblePassword,
                                changeVisibility: signInCubit.changeVisibility,
                                prefixIcon: Assets.iconsPasswordIconSvg,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  MyTextButton(
                                    text: S.of(context).forgotPassword,
                                    style: getSemiBold(
                                      fontColor: AppColors.secondaryColor,
                                      fontSize: 12,
                                    ),
                                    function: () {},
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              MyDefaultButton(
                                text: S.of(context).signIn,
                                textSize: 16,
                                function: () {
                                  signInCubit.navigateToHomeScreen();
                                },
                                backGroundColor: AppColors.secondaryColor,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyResponsiveText(
                                    text: S.of(context).dontHaveAccount,
                                    style: getRegular(
                                      fontColor: AppColors.myGrey,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  MyTextButton(
                                    text: S.of(context).signUp,
                                    style: getSemiBold(
                                      fontColor: AppColors.secondaryColor,
                                      fontSize: 16,
                                    ),
                                    function: () {
                                      signInCubit.navigateToSignup();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
