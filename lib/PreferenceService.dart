import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {

  static const adminKey = "adminData";


  Future setData(bool newValue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(adminKey,newValue);
  }

  Future<bool> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final bool value =  prefs.getBool(adminKey)??false;

    return value;


  }
}