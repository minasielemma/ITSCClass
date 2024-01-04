import 'package:get/get.dart';
import 'package:todolist/modules/login/login_binding.dart';
import 'package:todolist/modules/login/login_page.dart';
import 'package:todolist/modules/plan/plan_bindings.dart';
import 'package:todolist/modules/plan/plan_page.dart';
import 'package:todolist/modules/signup/signup_bindings.dart';
import 'package:todolist/modules/signup/signup_page.dart';
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
  ];
}
