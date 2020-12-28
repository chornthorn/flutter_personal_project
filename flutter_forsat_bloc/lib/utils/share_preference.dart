import 'package:shared_preferences/shared_preferences.dart';

class AppSharePreference {

  Future<String> getToken () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.getString("token");
    return result;
  }

  setToken ({String token}) async{ // 1 auth, 0 not auth
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  clearToken () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
  }

}
