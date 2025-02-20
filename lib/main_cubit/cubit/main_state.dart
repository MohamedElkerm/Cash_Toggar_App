part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

final class GetPhoneDetailsSuccessState extends MainState {}
final class GetPhoneDetailsErrorState extends MainState {}
final class GetPhoneDetailsLoadingState extends MainState {}

final class GetPhonePriceLoadingState extends MainState {}
final class GetPhonePriceSuccessState extends MainState {}

final class UploadingImagesState extends MainState {}
final class UploadStartedInBackgroundState extends MainState {}
