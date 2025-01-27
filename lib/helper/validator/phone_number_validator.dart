import '../../generated/l10n.dart';

String? phoneNumberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return S.current.validatorPhoneEmpty; // Return the translated error message
  } else if (value.length < 10) {
    return S.current.validatorPhoneNumber; // Return the translated error message
  }
  // Optional: Add regex validation for phone number format
  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return 'Phone number should contain only digits';
  }
  return null; // Return null if the input is valid
}