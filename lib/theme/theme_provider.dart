import 'package:app_four_note_offline_database/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  // initialy, theme is light mode
  ThemeData _themeData = lightMode;

// getter method to access the theme from other part of the code
  ThemeData get themeData => _themeData;

// getter method to see if we are in the dark or not
  bool get isDarkMode => _themeData == darkMode;

//  setter method to get the new theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

// we will use this toggle in a switch later an..
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
