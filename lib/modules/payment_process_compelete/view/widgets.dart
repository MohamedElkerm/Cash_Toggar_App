import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.textInputType,
  });

  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center, // Centers the text (including the hint text)

      controller: textEditingController,
      decoration: InputDecoration(

        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,

        ),
        fillColor: Colors.grey[200],
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 12
      ),
      keyboardType: textInputType,
    );
  }
}
