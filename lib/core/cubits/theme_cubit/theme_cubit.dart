import 'package:bloc/bloc.dart';
import 'package:frutes_app/constants.dart';
import 'package:frutes_app/core/services/shared_preferences_singleton.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(isDarkMode: false)) {
    _loadThemFromPrefs();
  }

  void toggleTheme() {
    final newIsDarkMode = !state.isDarkMode;
    emit(ThemeState(isDarkMode: newIsDarkMode));
    Prefs.setBool(kIsDarkMode, newIsDarkMode);
  }

  void _loadThemFromPrefs() {
    final isDarkMode = Prefs.getBool(kIsDarkMode);
    emit(ThemeState(isDarkMode: isDarkMode));
  }
}
