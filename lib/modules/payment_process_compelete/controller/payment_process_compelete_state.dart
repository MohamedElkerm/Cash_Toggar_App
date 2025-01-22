part of 'payment_process_compelete_cubit.dart';

@immutable
sealed class PaymentProcessCompeleteState {}

final class PaymentProcessCompeleteInitial extends PaymentProcessCompeleteState {}

final class NavigateToPaymentProcessCompleteScreen extends PaymentProcessCompeleteState {}
final class NavigateToPaymentConfirmationScreen extends PaymentProcessCompeleteState {}

final class UpdateTheCurrentDetailsState extends PaymentProcessCompeleteState {}
