// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:operations/helper/global_widgets/custom_bottom_nav_bar/my_custom_bottom_nav_bar.dart';
// import 'package:operations/resources/colors_manager.dart';
//
// import 'cubit/bottom_nav_bar_screen_cubit.dart';
//
// class BottomNavBarScreen extends StatelessWidget {
//   const BottomNavBarScreen({super.key, required this.navigationShell});
//
//   final StatefulNavigationShell navigationShell;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => BottomNavBarScreenCubit(),
//       child: BlocConsumer<BottomNavBarScreenCubit, BottomNavBarScreenState>(
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           var bottomNavBarCubit =
//               BlocProvider.of<BottomNavBarScreenCubit>(context);
//           return Scaffold(
//             resizeToAvoidBottomInset: false, // Ensures keyboard avoids content
//
//             body: Stack(
//               children: [
//                 navigationShell,
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 16,
//                       horizontal: 16,
//                     ),
//                     child: CustomBottomNavBar(
//                       currentIndex: navigationShell.currentIndex,
//                       onTap: navigationShell.goBranch,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//             // bottomNavigationBar: BottomNavigationBar(
//             //   selectedItemColor: AppColors.primary_700_main,
//             //   unselectedItemColor: AppColors.secondary_400_main,
//             //
//             //   currentIndex: navigationShell.currentIndex,
//             //   items: bottomNavBarCubit.bottomNavBarItems,
//             //   onTap: navigationShell.goBranch,
//             // ),
//           );
//         },
//       ),
//     );
//   }
// }
