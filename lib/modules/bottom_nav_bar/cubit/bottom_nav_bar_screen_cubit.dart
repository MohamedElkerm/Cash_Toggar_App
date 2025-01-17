// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:meta/meta.dart';
// import 'package:operations/modules/bottom_nav_bar_modules/home/home_screen.dart';
// import 'package:operations/modules/bottom_nav_bar_modules/profile/profile_screen.dart';
// import 'package:operations/modules/bottom_nav_bar_modules/services/services_screen.dart';
// import 'package:operations/modules/sign_in/sign_in_screen.dart';
// import 'package:operations/resources/colors_manager.dart';
// import 'package:operations/resources/icons_manager.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../../../generated/l10n.dart';
//
// part 'bottom_nav_bar_screen_state.dart';
//
// class BottomNavBarScreenCubit extends Cubit<BottomNavBarScreenState> {
//   BottomNavBarScreenCubit() : super(BottomNavBarScreenInitial());
//
//   int currentIndex = 0;
//
//   void updateTheBottomNavBarIndex({required int newIndex}) {
//     currentIndex = newIndex;
//     emit(UpdateBottomNavBarIndexState());
//   }
//
//   List<BottomNavigationBarItem> bottomNavBarItems = [
//     BottomNavigationBarItem(
//       icon: SvgPicture.asset(
//         AppIcons.homeBoldIcon,
//         width: 20,
//         height: 20,
//         color: AppColors.primary_700_main,
//       ),
//       label: S.current.home,
//     ),
//     BottomNavigationBarItem(
//       icon: SvgPicture.asset(
//         AppIcons.servicesBoldIcon,
//         width: 20,
//         height: 20,
//         color: AppColors.primary_700_main,
//       ),
//       label: S.current.services,
//     ),
//     BottomNavigationBarItem(
//       icon: SvgPicture.asset(
//         AppIcons.profileBoldIcon,
//         width: 20,
//         height: 20,
//         color: AppColors.primary_700_main,
//       ),
//       label: S.current.profile,
//     ),
//   ];
//
//   List bottomNabBarScreens = [
//     HomeScreen(),
//     ServicesScreen(),
//     ProfileScreen(),
//   ];
//
//   Future<void> navigateToReferenceUrl({
//     required url,
//   }) async {
//     emit(OpenUrlOfReferenceLoadingState());
//     final Uri _urla = Uri.parse(url);
//     if (!await launchUrl(_urla)) {
//       emit(OpenUrlOfReferenceErrorState());
//       throw Exception(
//         'Could not launch $_urla',
//       );
//     } else {
//       emit(OpenUrlOfReferenceSuccessState());
//     }
//   }
// }
