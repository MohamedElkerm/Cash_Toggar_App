part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileSignOut extends ProfileState {}

final class NavigateToUserInfoScreen extends ProfileState {}

final class NavigateToHomeScreen extends ProfileState {}
