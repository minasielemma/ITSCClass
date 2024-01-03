import 'package:dio/dio.dart';
import 'package:todolist/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseApi {
  final dio = Dio(BaseOptions(baseUrl: ipAddress));

  setHeader() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    dio.options.headers["authorization"] = pref.getString("token");
  }
}
