import 'package:cash_toggar_app/helper/global_widgets/my_default_button.dart';
import 'package:cash_toggar_app/helper/global_widgets/sliver_widgets/custom_sliver_app_bar.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../helper/global_widgets/static_conteiner_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            StaticContainerHeader(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [

                  MyDefaultButton(text: S.of(context).userInformation, textSize: 16, function: (){},),
                  SizedBox(height:12 ,),

                  MyDefaultButton(text: S.of(context).changePassword, textSize: 16, function: (){},textColor: AppColors.primaryColor, backGroundColor: AppColors.myWhite,),
                  SizedBox(height:12 ,),

                  MyDefaultButton(text: S.of(context).changePassword, textSize: 16, function: (){},textColor: AppColors.primaryColor, backGroundColor: AppColors.myWhite,),
                  SizedBox(height:12 ,),

                  MyDefaultButton(text: S.of(context).rateUs, textSize: 16, function: (){},textColor: AppColors.primaryColor, backGroundColor: AppColors.myWhite,),
                  SizedBox(height:12 ,),

                  MyDefaultButton(text: S.of(context).changeLanguage, textSize: 16, function: (){},textColor: AppColors.primaryColor, backGroundColor: AppColors.myWhite,),
                  SizedBox(height:12 ,),

                  MyDefaultButton(text: S.of(context).callUs, textSize: 16, function: (){},textColor: AppColors.primaryColor, backGroundColor: AppColors.myWhite,),
                  SizedBox(height:12 ,),

                  MyDefaultButton(text: S.of(context).logOut, textSize: 16, function: (){},backGroundColor: AppColors.secondaryColor,),
                  SizedBox(height:MediaQueryValues(context).height * 0.1 ,),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
