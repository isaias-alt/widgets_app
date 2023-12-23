import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//  A simple bool
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Inmutabe color list
final colorListProvider = Provider((ref) => colorList);

// A simple int
final selectedColorProvider = StateProvider((ref) => 0);

// A custom AppTheme type object
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// State is a new intance of AppTeme()
class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
