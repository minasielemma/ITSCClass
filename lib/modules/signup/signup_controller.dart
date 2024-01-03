import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todolist/apis/signup_api.dart';
import 'package:todolist/models/user_account.dart';

class SignUpController extends GetxController {
  final firstNameEditingCOntroller = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final usernameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final password2EditingController = TextEditingController();
  final signupApi = SignUpApi();

  saveDate() async {
    UserAccount user = UserAccount(
        first_name: firstNameEditingCOntroller.text,
        last_name: lastNameEditingController.text,
        username: usernameEditingController.text,
        email: emailEditingController.text,
        password1: passwordEditingController.text,
        password2: password2EditingController.text);
    var res = await signupApi.saveUserAccount(user.toJson());
    print(res);
  }
}
