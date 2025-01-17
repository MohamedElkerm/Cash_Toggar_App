import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/colors_manager.dart';



class MyCustomSliverAppBar extends StatelessWidget {
  const MyCustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      /// Shape 1
      // shape: const ContinuousRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(40),
      //     bottomRight: Radius.circular(40),
      //     topLeft: Radius.circular(0),
      //     topRight: Radius.circular(0),
      //   ),
      // ),

      /// Shape 2
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24,),
          bottomRight: Radius.circular(24,),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 16,horizontal: 64
            ),
            child: FittedBox(
              /// TODO Add image here
              child: Image.asset(
                AppImages.baseImagePath,
                color: Colors.white,
              ),
            ),
          ) //Images.network
      ),
      backgroundColor: AppColors.primary_700_main,
      toolbarHeight: MediaQueryValues(context).height*0.12,
      // toolbarHeight: ,

    ) ;
  }
}

