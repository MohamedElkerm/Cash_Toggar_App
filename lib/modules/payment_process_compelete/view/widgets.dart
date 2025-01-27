import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.textInputType,
    required this.validator,
  });

  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String? Function(String?)? validator; // Explicitly define the validator type

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center, // Centers the text (including the hint text)
      validator: validator,
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
          borderSide: BorderSide.none, // No border by default
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!), // Default border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue), // Border color when focused
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red), // Border color when in error state
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red), // Border color when focused and in error state
        ),
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 12,
      ),
      keyboardType: textInputType,
    );
  }
}