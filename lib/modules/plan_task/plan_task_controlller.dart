import 'package:get/get.dart';
import 'package:todolist/apis/task_api.dart';
import 'package:todolist/models/task.dart';

class PlanTaskController extends GetxController {
  final arguments = Get.arguments;
  RxList<TaskModel> tasks = <TaskModel>[].obs;
  final taskApi = TaskApi();

  @override
  void onInit() {
    var planId = arguments["planId"];
    getTaskPlan(planId);
    super.onInit();
  }

  getTaskPlan(planId) async {
    var res = await taskApi.getTaskList(planId);
    if (res != null) {
      res.forEach((item) {
        TaskModel task = TaskModel.fromJson(item);
        tasks.add(task);
      });
    }
  }
}
