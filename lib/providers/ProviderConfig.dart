import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderConfig extends ChangeNotifier {
  String languageApp = 'en';

  Future<void> changeLanguage(String languageNew) async {
    if (languageApp == languageNew) {
      return;
    }
    languageApp = languageNew;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', languageNew);
    print(prefs.getString('language'));
  }

  Future<void> getLanguageSP() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? language = prefs.getString('language');
    if (language != null) {
      languageApp = language;
      notifyListeners();
    }
  }
}
