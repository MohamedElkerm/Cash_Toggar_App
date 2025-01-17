// import 'package:EELU/helper/global_widgets/my_fill_button.dart';
// import 'package:EELU/resources/colors_manager.dart';
// import 'package:EELU/resources/fonts_style.dart';
// import 'package:EELU/resources/media_query_values.dart';
// import 'package:EELU/resources/strings/strings_in_ar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// /// TODO : Handle the ui for the alert update and add button to check updates from google play
// myCustomShowDialogForUpdate({
//   required String alertIcon,
//   required BuildContext context,
//   required String title,
//   required String body,
//   required bool forceUpdate,
// }) {
//   return Dialog(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(
//         16.0,
//       ),
//     ), //this right here
//     child: SizedBox(
//       height: MediaQueryValues(context).height * 0.40,
//       width: MediaQueryValues(context).width,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 16.0,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: MediaQueryValues(context).height * 0.1,
//               width: MediaQueryValues(context).width * 0.3,
//               child: Image.asset(
//                 alertIcon,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 style: const TextStyle(
//                   fontFamily: "Almarai",
//                 ),
//                 children: [
//                   TextSpan(
//                     text: title,
//                     style: getBold(
//                       fontColor: AppColors.primary_700_main,
//                       fontSize: 18,
//                     ).copyWith(height: 1.3),
//                   ),
//                   const TextSpan(text: '\n'),
//                   const TextSpan(text: '\n'),
//                   TextSpan(
//                     text: body,
//                     style: getRegular(
//                       fontColor: AppColors.primary_700_main,
//                       fontSize: 18,
//                     ).copyWith(height: 1.3),
//                   ),
//                   // const TextSpan(text: '\n'),
//                   const TextSpan(text: '\n'),const TextSpan(text: '\n'),
//                   const TextSpan(text: '\n'),
//                 ],
//               ),
//             ),
//             MyButton(
//               textStyle: getBold(
//                 fontColor: AppColors.b_w_25,
//                 fontSize: 18,
//               ),
//               btnName: AppStringsInArabic.updateNow,
//               function: () async {
//                 final Uri _urla = Uri.parse(
//                     "https://play.google.com/store/apps/details?id=com.eelu.eelu_app");
//                 if (!await launchUrl(_urla)) {
//                   throw Exception(
//                     'Could not launch $_urla',
//                   );
//                 } else {}
//               },
//             ),
//             forceUpdate
//                 ? const SizedBox()
//                 : MyButton(
//                     btnColor: Colors.transparent,
//                     btnBorderColor: Colors.transparent,
//                     textStyle: getBold(
//                       fontColor: AppColors.primary_700_main,
//                       fontSize: 18,
//                     ),
//                     btnName: AppStringsInArabic.updateLate,
//                     function: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
