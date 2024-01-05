import 'package:dio/dio.dart';

import 'base_api.dart';

class TaskApi extends BaseApi {
  getTaskList(planId) async {
    await setHeader();
    final res = await dio.get("to_do_app/plans/$planId/tasks/");
    if (res.statusCode == 200) {
      return res.data;
    }
    return null;
  }

  createTask(var jsonData, planId) async {
    try {
      await setHeader();
      jsonData["pid"] = planId;
      var res = await dio.post('to_do_app/task/create/', data: jsonData);
      if (res.statusCode == 201) {
        return res.data;
      }
      return null;
    } on DioException catch (e) {
      print(e.response!.data);
    }
  }
}
