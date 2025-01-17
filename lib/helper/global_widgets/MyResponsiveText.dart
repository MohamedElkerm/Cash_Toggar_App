import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MyResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int maxLines;
  final double minFontSize;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final TextDirection textDirection;

  const MyResponsiveText({
    Key? key,
    required this.text,
    required this.style,
    this.maxLines = 1,
    this.minFontSize = 12,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.ellipsis,
    this.textDirection = TextDirection.ltr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: style,
      maxLines: maxLines,
      minFontSize: minFontSize,
      textAlign: textAlign,
      overflow: overflow,
      textDirection:textDirection ,
    );
  }
}
