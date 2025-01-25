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
