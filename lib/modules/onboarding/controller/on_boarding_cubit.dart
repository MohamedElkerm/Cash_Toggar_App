import 'package:bloc/bloc.dart';
import 'package:cash_toggar_app/generated/assets.dart';
import 'package:cash_toggar_app/helper/routing/app_routes.dart';
import 'package:cash_toggar_app/helper/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../generated/l10n.dart';
import '../../../helper/local/cache_helper.dart';
import '../../../helper/local/cache_helper_keys.dart';
import '../../../resources/assets_manager.dart';
import '../model/on_boarding_model.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  static int currentOnBoardingIndex = 0;
  int dotIndex = currentOnBoardingIndex;

  final controller = PageController(
    initialPage: currentOnBoardingIndex,
  );

  void changeTheOnBoardingIndex() {
    currentOnBoardingIndex = controller.page!.round();
    dotIndex = currentOnBoardingIndex;
    emit(ChangeTheIndexOfOnBoardingIndicatorState());
  }

  final pages = List.generate(
    3,
    (index) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade300,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    ),
  );

  List<OnBoardingModel> myOnBoardingModels = [
    OnBoardingModel(
      imagePath: Assets.onBoardingImagesOnboardingScreenOne,
      header: S.current.onBoardingHeaderOne,
      description: S.current.onBoardingBodyOne,
    ),
    OnBoardingModel(
      imagePath: Assets.onBoardingImagesOnboardingScreenTwoSvg,
      header: S.current.onBoardingHeaderTwo,
      description: S.current.onBoardingBodyTwo,
    ),
    OnBoardingModel(
      imagePath: Assets.onBoardingImagesOnboardingScreenThreeSvg,
      header: S.current.onBoardingHeaderThree,
      description: S.current.onBoardingBodyThree,
    ),
  ];

  navigateToSignInScreen({required context}) async {
    disposeTheListener();
    router.pushReplacementNamed(
      AppRoutesNamed.signInScreen,
    );
    await CacheHelper.saveData(
      key: CacheHelperKeys.onBoardDone,
      value: true,
    );
    // print(CacheHelper.getData(
    //   key: CacheHelperKeys.onBoardDone,
    // ));
    emit(NavigateToSignInScreenState());
  }

  void initTheListener() {
    controller.addListener(() {
      changeTheOnBoardingIndex();
    });
  }

  void disposeTheListener() {
    controller.dispose();
    emit(DisposeTheControllerListenerState());
  }
}
