import 'package:get/get.dart';
import 'package:todolist/modules/notification/notifcaitions_controller.dart';

class NotificationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}
