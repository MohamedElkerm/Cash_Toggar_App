import 'package:cash_toggar_app/helper/global_widgets/my_default_button.dart';
import 'package:cash_toggar_app/helper/global_widgets/sliver_widgets/custom_sliver_app_bar.dart';
import 'package:cash_toggar_app/helper/localization/cubit/localization_cubit.dart';
import 'package:cash_toggar_app/modules/bottom_nav_modules/profile/controller/profile_cubit.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../../helper/global_widgets/static_conteiner_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var profileCubit = BlocProvider.of<ProfileCubit>(context);
          return BlocConsumer<LocalizationCubit, LocalizationState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var localizationCubit =
                  BlocProvider.of<LocalizationCubit>(context);
              return Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      StaticContainerHeader(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            MyDefaultButton(
                              text: S.of(context).userInformation,
                              textSize: 16,
                              function: () {
                                profileCubit.navigateToUserInformationScreen();
                              },
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            MyDefaultButton(
                              text: S.of(context).walletBalance,
                              textSize: 16,
                              function: () {
                                profileCubit.navigateToWalletBalanceScreen();
                              },
                              textColor: AppColors.primaryColor,
                              backGroundColor: AppColors.myWhite,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            MyDefaultButton(
                              text: S.of(context).changePassword,
                              textSize: 16,
                              function: () {},
                              textColor: AppColors.primaryColor,
                              backGroundColor: AppColors.myWhite,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            MyDefaultButton(
                              text: S.of(context).rateUs,
                              textSize: 16,
                              function: () {},
                              textColor: AppColors.primaryColor,
                              backGroundColor: AppColors.myWhite,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            PopupMenuButton<String>(
                              child: MyDefaultButtonWithoutTapping(
                                text: S.of(context).changeLanguage,
                                textSize: 16,
                                // Remove the `function` callback here
                                textColor: AppColors.primaryColor,
                                backGroundColor: AppColors.myWhite,
                              ),
                              onSelected: (String value) {
                                // Update the language when an item is selected
                                localizationCubit.updateTheLanguageItem(
                                  value: value,
                                  context: context,
                                );
                              },
                              itemBuilder: (BuildContext context) {
                                return localizationCubit.languages
                                    .map((String value) {
                                  return PopupMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList();
                              },
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            MyDefaultButton(
                              text: S.of(context).callUs,
                              textSize: 16,
                              function: () {},
                              textColor: AppColors.primaryColor,
                              backGroundColor: AppColors.myWhite,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            MyDefaultButton(
                              text: S.of(context).logOut,
                              textSize: 16,
                              function: () {
                                profileCubit.signOut();
                              },
                              backGroundColor: AppColors.secondaryColor,
                            ),
                            SizedBox(
                              height: MediaQueryValues(context).height * 0.1,
                            ),
                          ],
                        ),
                      ),
                    ],
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
