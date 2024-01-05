import 'package:get/get.dart';
import 'package:todolist/modules/tasks/task_controller.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskController());
  }
}
