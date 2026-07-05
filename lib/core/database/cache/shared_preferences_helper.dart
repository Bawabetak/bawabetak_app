import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  late SharedPreferences _sharedPreferences;

  SharedPreferencesHelper._();

  static final instance = SharedPreferencesHelper._();

  factory SharedPreferencesHelper() => instance;

  //Initialiaze of ShardPreferences
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //Set Of Data
  Future<bool> set({required String key, required dynamic value}) async {
    if (value is String) {
      return await _sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await _sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await _sharedPreferences.setDouble(key, value);
    }
    return await _sharedPreferences.setBool(key, value);
  }

  //Get Of Data

  dynamic get({required String key}) {
    return _sharedPreferences.get(key);
  }

  //Clear Of Specific Key
  Future<bool> remove({required String key}) async {
    return await _sharedPreferences.remove(key);
  }

  //Remove All Data
  Future<bool> clear() async {
    return _sharedPreferences.clear();
  }

  // Remove list of keys
  Future<void> removeKeys({required List<String> keys}) async {
    for (final key in keys) {
      await _sharedPreferences.remove(key);
    }
  }
}
