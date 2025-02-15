import 'package:bloc/bloc.dart';
import 'package:cash_toggar_app/helper/bloc_observer.dart';
import 'package:cash_toggar_app/helper/global_vars.dart';
import 'package:cash_toggar_app/helper/local/cache_helper.dart';
import 'package:cash_toggar_app/helper/local/cache_helper_keys.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app_start_point.dart';
import 'firebase_options.dart';
import 'helper/routing/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper.init();

  var onBoardDone = CacheHelper.getData(
    key: CacheHelperKeys.onBoardDone,
  ) ?? false;

  var userSignIn = CacheHelper.getData(
    key: CacheHelperKeys.uId,
  ) ?? '';


  // print('onBoardDone: $onBoardDone');
  if(onBoardDone){

    if(userSignIn != ''){
      initLocation = AppRoutes.homeScreen;

    }
    else{
      initLocation = AppRoutes.signInScreen;
    }
  }else {
    initLocation = AppRoutes.onBoardingScreen;
  }

  MyBlocObserver myBlocObserver = MyBlocObserver();
  Bloc.observer = myBlocObserver;

  runApp(
    const CashToggar(),
  );
}
