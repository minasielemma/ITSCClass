import 'package:dio/dio.dart';

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
      print(e.response!.data);
    }
  }
}
