import '../../generated/l10n.dart';

String? lastNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return S.current.validatorLastName;
  }
  // Optional: Check if the name contains only letters and spaces
  if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
    return S.current.validatorLastNameWrong;
  }
  return null; // Valid
}
