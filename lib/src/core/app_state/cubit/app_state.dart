part of 'app_cubit.dart';

class AppState {
  final ThemeData theme;
  final Locale locale;
  final bool isDark;
  final String lang;

  AppState({
    required this.theme,
    required this.locale,
    required this.isDark,
    required this.lang,
  });

  AppState copyWith({
    Locale? locale,
    ThemeData? theme,
    bool? isDark,
    String? lang,
  }) {
    return AppState(
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
      isDark: isDark ?? this.isDark,
      lang: lang ?? this.lang,
    );
  }
}
