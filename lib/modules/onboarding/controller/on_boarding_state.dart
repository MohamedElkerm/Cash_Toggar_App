part of 'on_boarding_cubit.dart';

@immutable
abstract class OnBoardingState {}

class OnBoardingInitial extends OnBoardingState {}


class NavigateToSignInScreenState extends OnBoardingState {}

class ChangeTheIndexOfOnBoardingIndicatorState extends OnBoardingState {}
class DisposeTheControllerListenerState extends OnBoardingState {}
