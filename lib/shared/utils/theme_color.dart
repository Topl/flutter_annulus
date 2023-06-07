import 'dart:ui';

import 'package:flutter/material.dart';

/// function to get selected color based on theme selected (dark or light)
/// QQQQ deleting this will lead to most the places you need to change to use theme
Color getSelectedColor(ThemeMode colorMode, int primaryColor, int secondaryColor) {
  switch (colorMode) {
    case ThemeMode.light:
      return Color(primaryColor);
    case ThemeMode.dark:
      return Color(secondaryColor);
    default:
      return const Color(0xFFFEFEFE);
  }
}
