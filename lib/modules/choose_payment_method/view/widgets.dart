import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../../helper/global_widgets/MyResponsiveText.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/fonts_style.dart';

class PaymentCardWidget extends StatelessWidget {
  const PaymentCardWidget({
    super.key,
    required this.paymentName,
    required this.paymentLogo,
  });

  final String paymentName;
  final String paymentLogo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: Image.network(
                paymentLogo,
                height: 50,
                width: 50,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            MyResponsiveText(
              text: paymentName,
              style: getSemiBold(
                fontColor: AppColors.primaryColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCardWidget extends StatelessWidget {
  const MyCardWidget({
    super.key,
    required this.adBody,
    required this.isVisible,
  });

  final String adBody;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: SizedBox(
        width: MediaQueryValues(context).width,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyResponsiveText(
              text: adBody,
              style: getBold(
                fontColor: AppColors.primaryColor,
                fontSize: 16,
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              maxLines: 10,
            ),
          ),
        ),
      ),
    );
  }
}
