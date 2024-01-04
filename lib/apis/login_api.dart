import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/apis/base_api.dart';
import 'package:todolist/networking/dio_exception.dart';
import 'package:todolist/utils/helper_widgets.dart';

class LoginApi extends BaseApi {
  login(var json) async {
    try {
      final res = await dio.post('auth/token/', data: json);
      if (res.statusCode == 200) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("token", res.data["access"]);
        return true;
      }
      return false;
    } on DioException catch (e) {
      showMessage("Error Message", NetworkException.errorType(e));
      return false;
    }
  }
}
