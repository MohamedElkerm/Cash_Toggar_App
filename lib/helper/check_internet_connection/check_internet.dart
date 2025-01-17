// import 'package:eelu_app/app_start_point.dart';
// import 'package:eelu_app/helper/check_internet_connection/check_internet_cubit/check_internet_cubit.dart';
// import 'package:eelu_app/helper/check_internet_connection/no_internet_page.dart';
// import 'package:flutter/material.dart';
//
// void checkInternet(state, context) {
//   if (state is InternetConnectionError) {
//     print("InternetConnectionErrorFunc");
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => const NoInternetConnectionPage()));
//   }
//   if (state is InternetConnectionSuccess) {
//     print("InternetConnectionSuccessFunc");
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => const AppStartPoint()));
//   }
// }
