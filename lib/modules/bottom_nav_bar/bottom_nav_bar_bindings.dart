import 'package:get/get.dart';
import 'package:todolist/modules/bottom_nav_bar/bottom_nav_bar_controller.dart';

class BottomNavBarBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavBarController());
  }
}
