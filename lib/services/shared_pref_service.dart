import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static const String prefsEmailKey = 'bookcase-email-key';
  static const String prefsPasswordKey = 'bookcase-password-key';

  void saveUserData(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(prefsEmailKey, email);
    prefs.setString(prefsPasswordKey, password);
  }

  void removeUserData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(prefsEmailKey);
    prefs.remove(prefsPasswordKey);
  }

  /// Returns list with user email and password
  /// or empty list if user email or password does not exists
  Future<List<String>> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(prefsEmailKey) &&
        prefs.containsKey(prefsPasswordKey)) {
      final list = [];

      list.add(prefs.getString(prefsEmailKey));
      list.add(prefs.getString(prefsPasswordKey));

      return list;
    }

    return [];
  }
}
