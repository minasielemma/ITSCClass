import 'package:get/get.dart';
import 'package:todolist/modules/plan_task/plan_task_controlller.dart';

class PlanTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlanTaskController());
  }
}
