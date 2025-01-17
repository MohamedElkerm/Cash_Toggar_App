// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';
//
// part 'check_internet_state.dart';
//
// class CheckInternetCubit extends Cubit<CheckInternetState> {
//   CheckInternetCubit() : super(CheckInternetInitial());
//
//   var firstConnectionResult;
//
//   checkInternetConnectionFirstTime({required context}) async {
//     print('start');
//     firstConnectionResult = await Connectivity().checkConnectivity();
//     if (firstConnectionResult == ConnectivityResult.none) {
//       print('checkInternetConnectionFirstTimeError');
//       emit(InternetConnectionError());
//     } else {
//       print('checkInternetConnectionFirstTimeSuccess');
//       emit(InternetConnectionSuccess());
//     }
//   }
//
//   StreamSubscription? streamSubscription;
//
//   checkInternetConnection({required context}) async {
//     streamSubscription = Connectivity()
//         .onConnectivityChanged
//         .listen((ConnectivityResult result) {
//       if (result == ConnectivityResult.none) {
//         print('checkInternetConnectionError');
//         emit(InternetConnectionError());
//       } else {
//         print("checkInternetConnectionSuccess");
//         emit(InternetConnectionSuccess());
//       }
//     });
//   }
//
//
//   @override
//   Future<void> close() {
//     streamSubscription!.cancel();
//     print("Closed !!");
//     return super.close();
//   }
// }
