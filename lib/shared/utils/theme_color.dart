import 'dart:ui';

import '../providers/app_theme_provider.dart';

/// function to get selected color based on theme selected (dark or light)

Color getSelectedColor(
    ColorMode colorMode, int primaryColor, int secondaryColor) {
  switch (colorMode) {
    case ColorMode.light:
      return Color(primaryColor);
    case ColorMode.dark:
      return Color(secondaryColor);
    default:
      return const Color(0xFFFEFEFE);
  }
}
