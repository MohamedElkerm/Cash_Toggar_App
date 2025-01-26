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

final class PickImageLoadingState extends PaymentProcessCompeleteState {}
final class PickImageSuccessState extends PaymentProcessCompeleteState {}
final class PickImageErrorState extends PaymentProcessCompeleteState {}

final class CompressImageLoadingState extends PaymentProcessCompeleteState {}
final class CompressImageSuccessState extends PaymentProcessCompeleteState {}
final class CompressImageErrorState extends PaymentProcessCompeleteState {}

final class UploadingMoneyLoadingState extends PaymentProcessCompeleteState {}
final class UploadingMoneySuccessState extends PaymentProcessCompeleteState {}
final class UploadingMoneyErrorState extends PaymentProcessCompeleteState {}


final class UploadingImageLoadingState extends PaymentProcessCompeleteState {}
final class UploadingImageSuccessState extends PaymentProcessCompeleteState {}
final class UploadingImageErrorState extends PaymentProcessCompeleteState {}
