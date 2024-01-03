import 'package:get/get.dart';
import 'package:todolist/modules/signup/signup_bindings.dart';
import 'package:todolist/modules/signup/signup_page.dart';
import 'package:todolist/routes/app_routes.dart';

class AppPage {
  static List<GetPage> pages = [
    GetPage(
        name: AppRoutes.signUp,
        page: () => SignUpPage(),
        binding: SignupBindings()),
  ];
}
