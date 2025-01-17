// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../resources/colors_manager.dart';
// import '../../resources/fonts_style.dart';
// import '../../resources/icons_manager.dart';
// import 'MyResponsiveText.dart';
//
// class GetAttachWidget extends StatelessWidget {
//   GetAttachWidget({
//     super.key,
//     required this.pickFile,
//     required this.file,
//   });
//
//   final VoidCallback pickFile;
//   PlatformFile? file;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         height: MediaQuery.of(context).size.height * 0.08,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: Colors.white,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             children: [
//               // Button to pick a file
//               InkWell(
//                 onTap: pickFile,
//                 child: Center(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: AppColors.primary_700_main,
//                       borderRadius: BorderRadius.circular(
//                         8,
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: SvgPicture.asset(
//                         AppIcons.uploadFileIcon,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               // Display the file name or placeholder text
//               Center(
//                 child: Text(
//                   file == null ? "تصفح الملف من جهازك" : file!.name.toString(),
//                   overflow: TextOverflow.fade,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
