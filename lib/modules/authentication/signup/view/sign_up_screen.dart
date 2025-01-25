import 'package:cash_toggar_app/helper/global_widgets/my_default_button.dart';
import 'package:cash_toggar_app/helper/localization/cubit/localization_cubit.dart';
import 'package:cash_toggar_app/modules/authentication/signup/controller/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../../helper/global_widgets/MyResponsiveText.dart';
import '../../../../helper/global_widgets/my_text_butoon.dart';
import '../../../../helper/global_widgets/my_text_form_field.dart';
import '../../../../helper/global_widgets/static_conteiner_header.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/fonts_style.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var signUpCubit = BlocProvider.of<SignupCubit>(context);
          return BlocConsumer<LocalizationCubit, LocalizationState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var localCubit = BlocProvider.of<LocalizationCubit>(context);
              return Scaffold(
                body: Directionality(
                  textDirection: localCubit.isArabic()
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: SingleChildScrollView(
                    child: Form(
                      key: signUpCubit.formKeyForSignupScreen,
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
                                    text: S.of(context).signUp,
                                    style: getBold(
                                      fontColor: AppColors.primaryColor,
                                      fontSize: 26,
                                    ),
                                    textAlign: localCubit.isArabic()
                                        ? TextAlign.right
                                        : TextAlign.left,
                                  ),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: MyTextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return S
                                                .of(context)
                                                .validatorFirstName;
                                          }
                                          return null;
                                        },
                                        hintText: S.of(context).enterFirstName,
                                        label: S.of(context).firstName,
                                        textEditingController:
                                            signUpCubit.firstNameController,
                                        isPassword: false,
                                        isHidden: false,
                                        textInputType: TextInputType.text,
                                        prefixIcon: null,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: MyTextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return S
                                                .of(context)
                                                .validatorLastName;
                                          }
                                          return null;
                                        },
                                        hintText: S.of(context).enterLastName,
                                        label: S.of(context).lastName,
                                        textEditingController:
                                            signUpCubit.lastNameController,
                                        isPassword: false,
                                        isHidden: false,
                                        textInputType: TextInputType.text,
                                        prefixIcon: null,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                MyTextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return S.of(context).validatorEmail;
                                    }
                                    return null;
                                  },
                                  hintText: S.of(context).enterEmail,
                                  label: S.of(context).email,
                                  textEditingController:
                                      signUpCubit.emailController,
                                  isPassword: false,
                                  isHidden: false,
                                  textInputType: TextInputType.emailAddress,
                                  prefixIcon: Assets.iconsUserIconSvg,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                MyTextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return S.of(context).validatorPhoneNumber;
                                    }
                                    return null;
                                  },
                                  hintText: S.of(context).enterPhoneNumber,
                                  label: S.of(context).phoneNumber,
                                  textEditingController:
                                      signUpCubit.phoneController,
                                  isPassword: false,
                                  isHidden: false,
                                  textInputType: TextInputType.phone,
                                  prefixIcon: Assets.iconsPasswordIconSvg,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                MyTextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return S.of(context).validatorPassword;
                                    }
                                    return null;
                                  },
                                  hintText: S.of(context).enterPassword,
                                  label: S.of(context).password,
                                  textEditingController:
                                      signUpCubit.passwordController,
                                  isPassword: true,
                                  isHidden: !signUpCubit.isVisibile,
                                  textInputType: TextInputType.visiblePassword,
                                  changeVisibility:
                                      signUpCubit.changeVisibility,
                                  prefixIcon: Assets.iconsPasswordIconSvg,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Directionality(
                                  textDirection: localCubit.isArabic()
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Checkbox(
                                          checkColor: AppColors.myWhite,
                                          side: BorderSide(
                                            color: AppColors.secondaryColor,
                                            width: 2,
                                          ),
                                          activeColor: AppColors.secondaryColor,
                                          // fillColor: MaterialStateProperty.all(Colors.transparent),

                                          value: signUpCubit.agreeTheConditions,
                                          onChanged: (newValue) {
                                            signUpCubit
                                                .changeAgreeTheConditions(
                                              newValue: newValue,
                                            );
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            side: BorderSide(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 8,
                                        child: MyResponsiveText(
                                          textDirection: localCubit.isArabic()
                                              ? TextDirection.rtl
                                              : TextDirection.ltr,
                                          maxLines: 2,
                                          minFontSize: 11,
                                          overflow: TextOverflow.ellipsis,
                                          text: S.of(context).agreeConditions,
                                          style: getRegular(
                                            fontColor: AppColors.myGrey,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                MyDefaultButton(
                                  disabled: !signUpCubit.agreeTheConditions,
                                  isLoading: signUpCubit.signUpLoading,
                                  text: S.of(context).signUp,
                                  textSize: 16,
                                  function: () {
                                    signUpCubit.signUpUsingFirebase(
                                      context: context,
                                      isArabic: localCubit.isArabic(),
                                    );
                                  },
                                  backGroundColor: AppColors.secondaryColor,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Directionality(
                                  textDirection: localCubit.isArabic()
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: MyResponsiveText(
                                          text:
                                              S.of(context).alreadyHaveAccount,
                                          style: getRegular(
                                            fontColor: AppColors.myGrey,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: MyTextButton(
                                          text: S.of(context).signInHere,
                                          style: getSemiBold(
                                            fontColor: AppColors.secondaryColor,
                                            fontSize: 16,
                                          ),
                                          function: () {
                                            signUpCubit.navigateToSignInScreen(
                                              context: context,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
        },
      ),
    );
  }
}
