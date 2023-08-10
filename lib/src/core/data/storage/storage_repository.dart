import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  Future<SharedPreferences> accessStorage() async {
    return await SharedPreferences.getInstance();
  }

  Future read({
    required String key,
  }) async {
    SharedPreferences prefs = await accessStorage();
    return prefs.getString(key);
  }

  Future write({
    required String key,
    required String value,
  }) async {
    SharedPreferences prefs = await accessStorage();
    await prefs.setString(key, value);
    return '$key with value $value is saved';
  }

  Future delete({
    required String key,
  }) async {
    SharedPreferences prefs = await accessStorage();
    await prefs.remove(key);
    return '$key is removed';
  }
}
