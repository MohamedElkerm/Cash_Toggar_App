import 'package:cash_toggar_app/main_cubit/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../helper/global_widgets/my_default_button.dart';
import '../../../helper/global_widgets/my_text_form_field.dart';
import '../../../helper/global_widgets/sliver_widgets/custom_sliver_app_bar.dart';
import '../../../resources/colors_manager.dart';

class GetInternetPriceScreen extends StatelessWidget {
  const GetInternetPriceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var mainCubit = BlocProvider.of<MainCubit>(context);
          return CustomScrollView(
            slivers: [
              MyDefaultCustomSliverAppBarScreen(
                headerTitle: S.of(context).weDsl,
                refreshFunction: () {},
                backFunction: () {},
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      MyTextFormField(
                        hintText: S.of(context).weNum1,
                        label: S.of(context).weNum,
                        textEditingController: mainCubit.phoneController,
                        isPassword: false,
                        isHidden: false,
                        textInputType: TextInputType.emailAddress,
                        prefixIcon: Assets.iconsUserIconSvg,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      MyDefaultButton(
                        loadingColor: AppColors.primaryColor,
                        isLoading: mainCubit.loadingGetPrice,
                        text: S.of(context).payTheBill,
                        textSize: 16,
                        function: () {
                          mainCubit.getPrice(
                            context: context,
                          );
                        },
                        textColor: AppColors.primaryColor,
                        backGroundColor: AppColors.myWhite,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      mainCubit.totalPhonePrice == "" ||
                              mainCubit.totalPhonePrice == null
                          ? SizedBox()
                          : MyDefaultButton(
                              text: mainCubit.totalPhonePrice,
                              textSize: 16,
                              function: () {},
                              textColor: AppColors.myWhite,
                              backGroundColor: AppColors.primaryColor,
                            ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
