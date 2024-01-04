import 'package:get/get.dart';
import 'package:todolist/modules/plan/plan_controller.dart';

class PlanBIndings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlanController());
  }
}
