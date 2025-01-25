import 'package:auto_size_text/auto_size_text.dart';
import 'package:cash_toggar_app/generated/assets.dart';
import 'package:cash_toggar_app/helper/global_widgets/my_default_button.dart';
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../generated/l10n.dart';
import '../../../helper/global_widgets/MyResponsiveText.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/fonts_style.dart';
import '../controller/on_boarding_cubit.dart';
import 'on_boarding_widgets.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit()..initTheListener(),
      child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final myOnBoardingCubit = BlocProvider.of<OnBoardingCubit>(context);
          return Scaffold(
            backgroundColor: AppColors.b_w_50,
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 32, right: 32, left: 32),
              child: SizedBox(
                height: MediaQueryValues(context).height * 0.1,
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: MyIndicator(
                        controller: myOnBoardingCubit.controller,
                        count: myOnBoardingCubit.pages.length,
                        activeDotColor: AppColors.secondaryColor,
                        dotColor: AppColors.myGrey,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQueryValues(context).height * 0.06,
                      child: myOnBoardingCubit.dotIndex == 0
                          ? MyDefaultButton(
                              function: () {
                                myOnBoardingCubit.controller.nextPage(
                                  duration: const Duration(
                                    milliseconds: 650,
                                  ),
                                  curve: Curves.easeInOut,
                                );
                              },
                              text: S.of(context).next,
                              textSize: 16,
                            )
                          : Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: MyDefaultButton(
                                    backGroundColor: Color(
                                      0xffE8E8E8,
                                    ),
                                    function: () {
                                      myOnBoardingCubit.controller.previousPage(
                                        duration: const Duration(
                                          milliseconds: 650,
                                        ),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    text: S.of(context).previous,
                                    textSize: 16,
                                    textColor: AppColors.myGrey,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 6,
                                  child: MyDefaultButton(
                                    function: () {
                                      myOnBoardingCubit.dotIndex == 1
                                          ? myOnBoardingCubit.controller
                                              .nextPage(
                                              duration: const Duration(
                                                milliseconds: 650,
                                              ),
                                              curve: Curves.easeInOut,
                                            )
                                          : myOnBoardingCubit
                                              .navigateToSignInScreen(
                                              context: context,
                                            );
                                    },
                                    text: myOnBoardingCubit.dotIndex == 1
                                        ? S.of(context).next
                                        : S.of(context).enter,
                                    textSize: 16,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              toolbarHeight: MediaQueryValues(context).height * 0.05,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: AppColors.primaryColor,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leadingWidth: MediaQueryValues(context).width * 0.7,
              actions: [
                myOnBoardingCubit.dotIndex != 2
                    ? FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SkipButton(
                          function: () {
                            myOnBoardingCubit.navigateToSignInScreen(
                              context: context,
                            );
                          },
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            body: PageView.builder(
              controller: myOnBoardingCubit.controller,
              itemCount: myOnBoardingCubit.myOnBoardingModels.length,
              itemBuilder: (context, index) {
                // print(myOnBoardingCubit.controller.position);
                return ListView(
                  children: [
                    const MakeSpaceFromStatusBar(),
                    // TODO : add logic to skip button

                    SvgPicture.asset(
                      "assets/images/on_boarding_images/onnoarding_header_logo.svg",
                    ),

                    SizedBox(
                      height: 32,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: OnBoardingImage(
                        imagePath: myOnBoardingCubit
                            .myOnBoardingModels[index].imagePath,
                      ),
                    ),
                    Center(
                      child: MyResponsiveText(
                        text:
                            myOnBoardingCubit.myOnBoardingModels[index].header,
                        style: getSemiBold(
                          fontColor: AppColors.primaryColor,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 0,
                      ),
                      child: MyResponsiveText(
                        text: myOnBoardingCubit
                            .myOnBoardingModels[index].description,
                        // textDirection: TextDirection.rtl,
                        style: getRegular(
                          fontColor: AppColors.primaryColor,
                          fontSize: 18.0,
                        ),

                        textAlign: TextAlign.center,
                        maxLines: 8,
                      ),
                    ),
                    SizedBox(
                      height: MediaQueryValues(context).height * 0.04,
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
