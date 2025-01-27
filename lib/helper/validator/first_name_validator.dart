import '../../generated/l10n.dart';

String? firstNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return S.current.validatorFirstName;
  }
  // Optional: Check if the name contains only letters and spaces
  if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
    return S.current.validatorFirstNameWrong;
  }
  return null; // Valid
}
