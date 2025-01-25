part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}
final class SigninVisibilityChangeState extends SignupState {}
final class SignupAgreeTheConditionsChangeState extends SignupState {}



final class NavigateToSigninScreenState extends SignupState {}
final class NavigateToHomeScreenState extends SignupState {}

final class SignupLoadingState extends SignupState {}
final class SignupSuccessState extends SignupState {}
final class SignupErrorState extends SignupState {}