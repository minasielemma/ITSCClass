import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/modules/login/login_controller.dart';
import 'package:todolist/utils/helper_widgets.dart';
import 'package:todolist/utils/text_form_field.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                MyTextFormField(
                    hintText: "User name",
                    controller: controller.usernameEditingController,
                    val: (value) {
                      if (value == null) {
                        return "Username can not be empty";
                      } else {
                        return null;
                      }
                    },
                    obscure: false),
                columnHeight,
                MyTextFormField(
                    hintText: "Password",
                    controller: controller.passwordEditingController,
                    val: (value) {
                      if (value == null) {
                        return "password can not be empty";
                      } else if (value.length < 8) {
                        return "password can not be less than 8";
                      } else {
                        return null;
                      }
                    },
                    obscure: true),
                columnHeight,
                OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.login();
                      }
                    },
                    child: const Text("Login"))
              ],
            )),
      );
    });
  }
}
