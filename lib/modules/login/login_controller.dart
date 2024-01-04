import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/apis/login_api.dart';
import 'package:todolist/routes/app_routes.dart';

class LoginController extends GetxController {
  final usernameEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final loginApi = LoginApi();

  login() async {
    var data = {
      "username": usernameEditingController.text,
      "password": passwordEditingController.text
    };
    var res = await loginApi.login(data);
    if (res) {
      Get.toNamed(AppRoutes.plan);
    } else {}
  }
}
