import 'package:cash_toggar_app/helper/global_widgets/my_default_button.dart';
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
          return Scaffold(
            body: Directionality(
              textDirection: TextDirection.ltr,
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
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MyTextFormField(
                                hintText: S.of(context).enterFirstName,
                                label: S.of(context).firstName,
                                textEditingController:
                                    signUpCubit.firstNameController,
                                isPassword: false,
                                isHidden: false,
                                textInputType: TextInputType.text,
                                isArabic: false,
                                prefixIcon: null,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: MyTextFormField(
                                hintText: S.of(context).enterLastName,
                                label: S.of(context).lastName,
                                textEditingController:
                                    signUpCubit.lastNameController,
                                isPassword: false,
                                isHidden: false,
                                textInputType: TextInputType.text,
                                isArabic: false,
                                prefixIcon: null,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        MyTextFormField(
                          hintText: S.of(context).enterEmail,
                          label: S.of(context).email,
                          textEditingController: signUpCubit.emailController,
                          isPassword: false,
                          isHidden: false,
                          textInputType: TextInputType.emailAddress,
                          isArabic: false,
                          prefixIcon: Assets.iconsUserIconSvg,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        MyTextFormField(
                          hintText: S.of(context).enterPhoneNumber,
                          label: S.of(context).phoneNumber,
                          textEditingController: signUpCubit.phoneController,
                          isPassword: false,
                          isHidden: false,
                          textInputType: TextInputType.phone,
                          isArabic: false,
                          prefixIcon: Assets.iconsPasswordIconSvg,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        MyTextFormField(
                          hintText: S.of(context).enterPassword,
                          label: S.of(context).password,
                          textEditingController: signUpCubit.passwordController,
                          isPassword: true,
                          isHidden: !signUpCubit.isVisibile,
                          textInputType: TextInputType.visiblePassword,
                          isArabic: false,
                          changeVisibility: signUpCubit.changeVisibility,
                          prefixIcon: Assets.iconsPasswordIconSvg,
                        ),SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: AppColors.myWhite,
                              side: BorderSide(
                                color: AppColors.secondaryColor,
                                width: 2,
                              ),
                              activeColor: AppColors.secondaryColor,
                              // fillColor: MaterialStateProperty.all(Colors.transparent),

                              value: signUpCubit.agreeTheConditions,
                              onChanged: (newValue) {
                                signUpCubit.changeAgreeTheConditions(
                                  newValue: newValue,
                                );
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            MyResponsiveText(
                              maxLines: 2,
                              minFontSize: 11,
                              overflow: TextOverflow.ellipsis,
                              text: S.of(context).agreeConditions,
                              style: getRegular(
                                fontColor: AppColors.myGrey,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        MyDefaultButton(
                          text: S.of(context).signUp,
                          textSize: 16,
                          function: () {},
                          backGroundColor: AppColors.secondaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
