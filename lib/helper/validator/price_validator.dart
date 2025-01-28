import 'package:cash_toggar_app/generated/l10n.dart';

String? priceValidator(String? value) {
  // Check if the value is empty
  if (value == null || value.isEmpty) {
    return S.current.validatorAmountEmpty;
  }

  // Check if the value starts with a leading zero
  if (value.startsWith('0') && value.length > 1) {
    return S.current.priceValidatorValid;
  }

  // Check if the value is a valid number
  final parsedValue = int.tryParse(value);
  if (parsedValue == null) {
    return S.current.priceValidatorValid;
  }

  // Check if the value is within the range of 15 to 60000
  if (parsedValue < 15 || parsedValue > 60000) {
    return S.current.moneyRange;
  }

  // If all checks pass, return null (valid)
  return null;
}