import 'base_api.dart';

class TaskApi extends BaseApi {
  getTaskList(planId) async {
    final res = await dio.get("to_do_app/plans/$planId/tasks/");
    if (res.statusCode == 200) {
      return res.data;
    }
    return null;
  }
}
