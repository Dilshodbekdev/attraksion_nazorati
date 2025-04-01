import 'package:atraksion_nazorati/src/config/theme/themes.dart';
import 'package:atraksion_nazorati/src/core/app_state/localization.dart';
import 'package:atraksion_nazorati/src/core/services/services.dart';
import 'package:atraksion_nazorati/src/core/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(AppState(
          theme: lightTheme,
          locale: Localization.uz,
          isDark: false,
          lang: 'uz',
        ));

  changeTheme(ThemeData theme) => emit(state.copyWith(theme: theme));

  toDark() {
    emit(state.copyWith(theme: darkTheme, isDark: true));
    Prefs.setBool(AppConstants.kDark, true);
  }

  toLight() {
    emit(state.copyWith(
      theme: lightTheme,
      isDark: false,
    ));
    Prefs.setBool(AppConstants.kDark, false);
  }

  changeLocale(Locale locale, String lang) {
    emit(state.copyWith(
      locale: locale,
      lang: lang,
    ));
    Prefs.setString(AppConstants.kLanguage, lang);
  }

  init() async {
    var isDark = await Prefs.getBool(AppConstants.kDark) ?? false;
    var lang = await Prefs.getString(AppConstants.kLanguage) ?? 'uz';
    var localization =
        Localization.all.firstWhere((element) => element.languageCode == lang);
    var theme = isDark ? darkTheme : lightTheme;
    emit(state.copyWith(
        theme: theme, locale: localization, isDark: isDark, lang: lang));
  }
}
