import 'package:cash_toggar_app/generated/l10n.dart';

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return S.current.validatorPassword;
  }
  // if (value.length < 8) {
  //   return S.current.validatorPassword2;
  // }

  return null; // Valid
}