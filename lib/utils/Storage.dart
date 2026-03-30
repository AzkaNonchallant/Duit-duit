import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static Future saveToken(String token) async {
    final p = await SharedPreferences.getInstance();
    p.setString("token", token);
  }

  static Future getToken() async {
    final p = await SharedPreferences.getInstance();
    return p.getString("token");
  }

  static Future logout() async {
    final p = await SharedPreferences.getInstance();
    p.remove("token");
  }
}