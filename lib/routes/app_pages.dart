import 'package:get/get.dart';
import 'package:todolist/modules/login/login_binding.dart';
import 'package:todolist/modules/login/login_page.dart';
import 'package:todolist/modules/notification/notification_bindings.dart';
import 'package:todolist/modules/notification/notifications_page.dart';
import 'package:todolist/modules/plan/plan_bindings.dart';
import 'package:todolist/modules/plan/plan_page.dart';
import 'package:todolist/modules/plan_task/plan_task_bindings.dart';
import 'package:todolist/modules/plan_task/plan_task_page.dart';
import 'package:todolist/modules/signup/signup_bindings.dart';
import 'package:todolist/modules/signup/signup_page.dart';
import 'package:todolist/modules/tasks/task_bindings.dart';
import 'package:todolist/modules/tasks/task_screen.dart';
import 'package:todolist/routes/app_routes.dart';

class AppPage {
  static List<GetPage> pages = [
    GetPage(
        name: AppRoutes.signUp,
        page: () => SignUpPage(),
        binding: SignupBindings()),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginPage(),
        binding: LoginBindings()),
    GetPage(
        name: AppRoutes.plan,
        page: () => PlanScreen(),
        binding: PlanBIndings()),
    GetPage(
        name: AppRoutes.task, page: () => TaskPage(), binding: TaskBinding()),
    GetPage(
        name: AppRoutes.planTask,
        page: () => const PlanTaskPage(),
        binding: PlanTaskBinding()),
    GetPage(
        name: AppRoutes.notification,
        page: () => NotifactionScreen(),
        binding: NotificationBindings())
  ];
}
