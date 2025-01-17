
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



import '../../resources/colors_manager.dart';
import '../../resources/fonts_style.dart';

myCustomShowDialog({
  required String alertIcon,
  required BuildContext context,
  required String text,
}) {

  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        8.0,
      ),
    ), //this right here
    child: SizedBox(
      height: MediaQueryValues(context).height * 0.35,
      width: MediaQueryValues(context).width,
      child: Padding(
        padding: const EdgeInsets.all(
          12.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQueryValues(context).height * 0.1,
              width: MediaQueryValues(context).width * 0.3,
              child: SvgPicture.asset(
                alertIcon,
                // fit: BoxFit.fill,
              ),
            ),

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: "Almarai",
                ),
                children: [
                  TextSpan(
                    text: "!. شكرا لك",
                    style: getBold(
                      fontColor: AppColors.primaryColor,
                      fontSize: 24,
                    ),
                  ),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text:text,
                    style: getBold(
                      fontColor: AppColors.primaryColor,
                      fontSize: 16,
                    ).copyWith(
                        height: 1.3
                    ),
                  ),

                ],
              ),
            ),
            // MyResponsiveText(
            //   textAlign: TextAlign.center,
            //   style: getBold(
            //     fontColor: AppColors.primary_700_main,
            //     fontSize: 16,
            //   ),
            // ),
          ],
        ),
      ),
    ),
  );
}


myCustomShowDialogForUnAuth({
  required BuildContext context,
}) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        8.0,
      ),
    ), //this right here
    child: SizedBox(
      height: MediaQueryValues(context).height * 0.35,
      width: MediaQueryValues(context).width,
      child: Padding(
        padding: const EdgeInsets.all(
          12.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: "Almarai",
                ),
                children: [
                  TextSpan(
                    text: "Alert",
                    style: getBold(
                      fontColor: AppColors.primary_700_main,
                      fontSize: 24,
                    ),
                  ),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text:
                    "Your Session is Expired \n Please login again.",
                    style: getBold(
                      fontColor: AppColors.primary_700_main,
                      fontSize: 16,
                    ).copyWith(
                        height: 1.3
                    ),
                  ),
                ],
              ),
            ),
            // MyResponsiveText(
            //   textAlign: TextAlign.center,
            //   style: getBold(
            //     fontColor: AppColors.primary_700_main,
            //     fontSize: 16,
            //   ),
            // ),
          ],
        ),
      ),
    ),
  );
}
