part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class NavigateToChoosePaymentMethodState extends HomeState {}

final class ChangeTheValueOfIsSendingProcessState extends HomeState {}

final class CopyTheUserNumberIdState extends HomeState {}

final class GetTheUserDataLoadingState extends HomeState {}
final class GetTheUserDataSuccessState extends HomeState {}
final class GetTheUserDataErrorState extends HomeState {}

final class GetTheUserMoneyRecordsLoadingState extends HomeState {}
final class GetTheUserMoneyRecordsSuccessState extends HomeState {}
final class GetTheUserMoneyRecordsErrorState extends HomeState {}
