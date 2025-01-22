part of 'localization_cubit.dart';

@immutable
sealed class LocalizationState {}

final class LocalizationInitial extends LocalizationState {}

class UpdateTheLocaleState extends LocalizationState {}

class UpdateTheLanguageState extends LocalizationState {}

class UpdateTheLanguageByTheCachedValueState extends LocalizationState {}