import 'package:get/get.dart';
import 'package:todolist/routes/app_routes.dart';

class BottomNavBarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  changeSelectedIndex(int index) {
    selectedIndex.value = index;
    getSelectedPage();
  }

  getSelectedPage() {
    switch (selectedIndex.value) {
      case 0:
        Get.toNamed(AppRoutes.plan);
        break;
      case 1:
        Get.toNamed(AppRoutes.task);
        break;
      default:
        break;
    }
  }
}
