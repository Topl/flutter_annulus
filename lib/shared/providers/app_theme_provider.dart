import 'package:hooks_riverpod/hooks_riverpod.dart';

final appThemeColorProvider =
    StateNotifierProvider<ThemeColorNotifier, ColorMode>(
  (ref) {
    return ThemeColorNotifier();
  },
);

class ThemeColorNotifier extends StateNotifier<ColorMode> {
  ThemeColorNotifier() : super(ColorMode.light);

  void toggleTheme() {
    state = state == ColorMode.light ? ColorMode.dark : ColorMode.light;
  }
}

enum ColorMode { light, dark }
