import 'package:get/get.dart';
import 'package:todolist/modules/signup/signup_controller.dart';

class SignupBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
