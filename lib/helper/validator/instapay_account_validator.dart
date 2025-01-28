import '../../generated/l10n.dart';

String? instapayAccountValidator(String? value) {
  if (value == null || value.isEmpty) {
    return S.current.instapayAccValidator;
  }

  return null; // Valid
}