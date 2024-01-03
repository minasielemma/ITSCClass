import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/apis/base_api.dart';

class LoginApi extends BaseApi {
  login(var json) async {
    final res = await dio.post('auth/token/', data: json);
    if (res.statusCode == 200) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("token", res.data["access"]);
      return true;
    }
    return false;
  }
}
