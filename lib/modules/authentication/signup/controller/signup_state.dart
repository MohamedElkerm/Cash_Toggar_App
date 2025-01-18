part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}
final class SigninVisibilityChangeState extends SignupState {}
final class SignupAgreeTheConditionsChangeState extends SignupState {}
