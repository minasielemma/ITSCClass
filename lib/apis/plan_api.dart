import 'package:dio/dio.dart';
import 'package:todolist/networking/dio_exception.dart';
import 'package:todolist/utils/helper_widgets.dart';

import 'base_api.dart';

class PlanApi extends BaseApi {
  getAllPlan() async {
    try {
      await setHeader();
      var res = await dio.get("to_do_app/");
      if (res.statusCode == 200) {
        return res.data;
      }
      return null;
    } on DioException catch (e) {
      showMessage("Error Info", NetworkException.errorType(e));
      return null;
    }
  }

  createPlan(var json) async {
    try {
      var res = await dio.post("to_do_app/plan/create/", data: json);
      if (res.statusCode == 201) {
        return res.data;
      }
      return null;
    } on DioException catch (e) {
      showMessage("Error Message", NetworkException.errorType(e));
      return null;
    }
  }

  deletePlan(id) async {
    await setHeader();
    var res = await dio.delete('to_do_app/plan/$id/');
    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }
}
