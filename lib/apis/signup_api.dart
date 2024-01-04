import 'package:dio/dio.dart';
import 'package:todolist/networking/dio_exception.dart';
import 'package:todolist/utils/helper_widgets.dart';

import 'base_api.dart';

class SignUpApi extends BaseApi {
  saveUserAccount(var json) async {
    try {
      final res = await dio.post(
        'auth/register/',
        data: json,
      );
      return res.data;
    } on DioException catch (e) {
      showMessage("Error Message", NetworkException.errorType(e));
      ("Error Info", NetworkException.errorType(e));
    }
  }
}
