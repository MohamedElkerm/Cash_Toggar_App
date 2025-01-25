import 'package:cash_toggar_app/helper/localization/cubit/localization_cubit.dart';
import 'package:cash_toggar_app/modules/bottom_nav_modules/home/controller/home_cubit.dart';
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../helper/global_widgets/my_text_form_field.dart';
import '../../../helper/global_widgets/sliver_widgets/custom_sliver_app_bar.dart';

class UserInformationsScreen extends StatelessWidget {
  const UserInformationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LocalizationCubit, LocalizationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var localizationCubit = BlocProvider.of<LocalizationCubit>(context);
          return BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var homeCubit = BlocProvider.of<HomeCubit>(context);
              return CustomScrollView(
                slivers: [
                  MyDefaultCustomSliverAppBarScreen(
                    headerTitle: S.of(context).userInformation,
                    refreshFunction: () {},
                    backFunction: () {},
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: MyTextFormFieldViewOnly(
                                  label: S.of(context).firstName,
                                  initialValue: homeCubit.userModel.firstName,
                                  isArabic: localizationCubit.isArabic(),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: MyTextFormFieldViewOnly(
                                  label: S.of(context).lastName,
                                  initialValue: homeCubit.userModel.lastName,
                                  isArabic: localizationCubit.isArabic(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          MyTextFormFieldViewOnly(
                            label: S.of(context).phoneNumber,
                            initialValue: homeCubit.userModel.phoneNumber,
                            isArabic: localizationCubit.isArabic(),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          MyTextFormFieldViewOnly(
                            label: S.of(context).email,
                            initialValue: homeCubit.userModel.email,
                            isArabic: localizationCubit.isArabic(),
                          ),
                        ],
                      ),
                    ),
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
