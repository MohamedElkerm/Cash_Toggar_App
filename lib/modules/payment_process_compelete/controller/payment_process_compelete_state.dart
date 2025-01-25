part of 'payment_process_compelete_cubit.dart';

@immutable
sealed class PaymentProcessCompeleteState {}

final class PaymentProcessCompeleteInitial extends PaymentProcessCompeleteState {}

final class NavigateToPaymentProcessCompleteScreen extends PaymentProcessCompeleteState {}
final class NavigateToPaymentConfirmationScreen extends PaymentProcessCompeleteState {}

final class UpdateTheCurrentDetailsState extends PaymentProcessCompeleteState {}

final class GetAllPaymentGateWaysLoadingState extends PaymentProcessCompeleteState {}
final class GetAllPaymentGateWaysSuccessState extends PaymentProcessCompeleteState {}
final class GetAllPaymentGateWaysErrorState extends PaymentProcessCompeleteState {}


final class SendingMoneyLoadingState extends PaymentProcessCompeleteState {}
final class SendingMoneySuccessState extends PaymentProcessCompeleteState {}
final class SendingMoneyErrorState extends PaymentProcessCompeleteState {}
