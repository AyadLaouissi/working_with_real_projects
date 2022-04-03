import 'package:flutter/material.dart';

extension ThemeExtension on ThemeMode {
  String get name {
    switch (this) {
      case ThemeMode.system:
        return 'System theme';
      case ThemeMode.light:
        return 'Light theme';
      case ThemeMode.dark:
        return 'Dark theme';
    }
  }

  String imagePath() {
    switch (this) {
      case ThemeMode.system:
        return 'assets/themes/theme_system.svg';
      case ThemeMode.light:
        return 'assets/themes/theme_light.svg';
      case ThemeMode.dark:
        return 'assets/themes/theme_dark.svg';
    }
  }
}
