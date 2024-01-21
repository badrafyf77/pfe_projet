import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

const themeValue = "THEMESTATUS";

class DarkThemePreference {
  final box = GetStorage();

  setDarkTheme(bool value) async {
    await box.write(themeValue, value);
  }

  Future<bool> getTheme() async {
    return await box.read(themeValue) ?? false;
  }
}

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = GetStorage().read(themeValue) ?? false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
