import '../../generated/l10n.dart';

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return S.current.validatorEmail;
  }
  // Regex for basic email validation
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return S.current.validatorEmail;
  }
  return null; // Valid
}