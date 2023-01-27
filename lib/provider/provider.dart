import 'package:flutter/material.dart';

class provider extends ChangeNotifier{
  String appLocale = "en";
  ThemeMode appThemeMode = ThemeMode.light;

  changeappLocale (String currentLocale)
  {
    appLocale =  currentLocale;
    notifyListeners();
  }
  changeappTheme (ThemeMode currentMode )
  {
    appThemeMode = currentMode;
    notifyListeners();
  }

}