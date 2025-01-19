part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninVisibilityChangeState extends SigninState {}

final class SigninNavigateToSignupState extends SigninState {}

final class SigninNavigateToHomeState extends SigninState {}

final class SigninNavigateToForgetPasswordState extends SigninState {}
