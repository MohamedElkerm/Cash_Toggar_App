// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../../resources/colors_manager.dart';
// import '../../../resources/fonts_style.dart';
// import '../../../resources/icons_manager.dart';
// import '../MyResponsiveText.dart';
//
// class CustomBottomNavBar extends StatelessWidget {
//   final int currentIndex;
//   final ValueChanged<int> onTap;
//
//   const CustomBottomNavBar({
//     Key? key,
//     required this.currentIndex,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//           bottomRight: Radius.circular(20),
//           bottomLeft: Radius.circular(20),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, -5),
//           ),
//         ],
//       ),
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _buildNavItem(
//               selectedIcon: AppIcons.homeBoldIcon,
//               unselectedIcon: AppIcons.homeLinearIcon,
//               label: "الرئيسية",
//               isSelected: currentIndex == 0,
//               onTap: () => onTap(0),
//               context: context),
//           _buildNavItem(
//               selectedIcon: AppIcons.servicesBoldIcon,
//               unselectedIcon: AppIcons.servicesLinearIcon,
//               label: "الخدمات",
//               isSelected: currentIndex == 1,
//               onTap: () => onTap(1),
//               context: context),
//           _buildNavItem(
//               selectedIcon: AppIcons.profileBoldIcon,
//               unselectedIcon: AppIcons.profileLinearIcon,
//               label: "حسابي",
//               isSelected: currentIndex == 2,
//               onTap: () => onTap(2),
//               context: context),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNavItem({
//     required String selectedIcon,
//     required String unselectedIcon,
//     required String label,
//     required bool isSelected,
//     required VoidCallback onTap,
//     required BuildContext context,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: isSelected ? AppColors.primary_700_main : Colors.transparent,
//           borderRadius: BorderRadius.circular(
//             23,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(
//                 height: 30,
//                 width: 20,
//                 child: SvgPicture.asset(
//                   isSelected ? selectedIcon : unselectedIcon,
//                   color: isSelected ? Colors.white : AppColors.primary_700_main,
//                 ),
//               ),
//               const SizedBox(width: 5),
//               MyResponsiveText(
//                 text: label,
//                 style: getBold(
//                   fontColor: isSelected
//                       ? AppColors.myWhite
//                       : AppColors.primary_700_main,
//                   fontSize: 12,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
