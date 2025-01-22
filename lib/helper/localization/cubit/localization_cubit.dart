import 'package:bloc/bloc.dart';
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../generated/l10n.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/fonts_style.dart';
import '../../global_widgets/MyResponsiveText.dart';
import '../../local/cache_helper.dart';
import '../../local/cache_helper_keys.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());


  Locale locale = const Locale("ar");
  updateTheLocale({required Locale newLocale}){
    locale = newLocale;
    emit(UpdateTheLocaleState());
  }

  bool isArabic(){
    return Intl.getCurrentLocale() == "ar";
  }

  String currentLanguage =
  Intl.getCurrentLocale() == "ar" ? "Arabic" : "English";
  List<String> languages = ["English", "Arabic"];

  void updateTheLanguageItem({required value, required context}) {
    currentLanguage = value.toString();
    value.toString() == "English"
        ? {
      locale = Locale("en"),
      CacheHelper.saveData(
        key: CacheHelperKeys.langForLocalization,
        value: "en",
      ),
    }
        : {
      locale = Locale("ar"),
      CacheHelper.saveData(
        key: CacheHelperKeys.langForLocalization,
        value: "ar",
      ),
    };
    emit(UpdateTheLanguageState());



  }

  /// Get The Init Lang from the user
  void checkIfIHaveCachedLangOrNot() {
    /// If i don't have cache lang by default its english
    if (CacheHelper.getData(key: CacheHelperKeys.langForLocalization) == null) {
      locale = Locale("en");
    } else {
      locale = Locale(
          CacheHelper.getData(key: CacheHelperKeys.langForLocalization)
              .toString());
    }
  }


}
