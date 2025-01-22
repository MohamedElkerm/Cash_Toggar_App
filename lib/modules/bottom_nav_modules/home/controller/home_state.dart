part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class NavigateToChoosePaymentMethodState extends HomeState {}

final class ChangeTheValueOfIsSendingProcessState extends HomeState {}
