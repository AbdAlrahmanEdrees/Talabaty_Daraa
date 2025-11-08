import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  // Singleton pattern
  static final AppPreferences _instance = AppPreferences._internal();
  factory AppPreferences() => _instance;
  AppPreferences._internal();

  static SharedPreferences? _prefs;

  /// Initialize the shared preferences instance (call this before use)
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // ============================
  // KEYS
  // ============================
  static const String keyLanguage = 'language';
  static const String keyTheme = 'theme';
  static const String keyIsLoggedIn = 'is_logged_in';
  static const String keyUserRole = 'user_role';

  // ============================
  // LANGUAGE
  // ============================
  Future<void> setLanguage(String langCode) async { // ar  en
    await _prefs?.setString(keyLanguage, langCode);
  }

  String getLanguage() {
    return _prefs?.getString(keyLanguage) ?? 'ar'; // default Arabic
  }

  // ============================
  // THEME
  // ============================
  Future<void> setTheme(bool isDark) async {
    await _prefs?.setBool(keyTheme, isDark);
  }

  bool getTheme() {
    return _prefs?.getBool(keyTheme) ?? false; // false = light mode
  }

  // ============================
  // LOGIN STATUS
  // ============================
  Future<void> setLoggedIn(bool value) async {
    await _prefs?.setBool(keyIsLoggedIn, value);
  }

  bool isLoggedIn() {
    return _prefs?.getBool(keyIsLoggedIn) ?? false;
  }

  // ============================
  // USER ROLE
  // ============================
  Future<void> setUserRole(String role) async {
    await _prefs?.setString(keyUserRole, role);
  }

  String getUserRole() {
    return _prefs?.getString(keyUserRole) ?? 'customer';
  }

  // ============================
  // CLEAR ALL DATA (Logout)
  // ============================
  Future<void> clear() async {
    await _prefs?.clear();
  }
}
