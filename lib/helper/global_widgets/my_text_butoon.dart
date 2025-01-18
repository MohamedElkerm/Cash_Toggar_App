import 'package:cash_toggar_app/helper/global_widgets/MyResponsiveText.dart';
import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    required this.text,
    required this.style,
    required this.function,
  });

  final String text;
  final TextStyle style;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: MyResponsiveText(
        text: text,
        style: style,
      ),
    );
  }
}
