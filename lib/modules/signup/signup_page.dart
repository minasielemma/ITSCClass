import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/modules/signup/signup_controller.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
      ),
      body: GetBuilder<SignUpController>(builder: (controller) {
        return SafeArea(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyTextFormField(
                      val: (value) {
                        if (value == null) {
                          return "First name can not be null";
                        } else if (value.length <= 2) {
                          return "name can not be less than 2";
                        } else {
                          return null;
                        }
                      },
                      controller: controller.firstNameEditingCOntroller,
                      hintText: "First Name",
                    ),
                    MyTextFormField(
                        hintText: "Last Name",
                        controller: controller.lastNameEditingController,
                        val: (value) {
                          if (value == null) {
                            return "Last name can not be null";
                          } else if (value.length <= 2) {
                            return "name can not be less than 2";
                          } else {
                            return null;
                          }
                        }),
                    MyTextFormField(
                        hintText: "Username",
                        controller: controller.usernameEditingController,
                        val: (value) {
                          if (value == null) {
                            return "Username can not be null";
                          } else {
                            return null;
                          }
                        }),
                    MyTextFormField(
                        hintText: "Email",
                        controller: controller.emailEditingController,
                        val: (value) {
                          const pattern =
                              r"^[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*$";
                          final regExp = RegExp(pattern);
                          if (value == null) {
                            return "Email can not be null";
                          } else if (!regExp.hasMatch(value)) {
                            return "Your Email should look like this 'abc.def12@abc.com";
                          } else {
                            return null;
                          }
                        }),
                    MyTextFormField(
                        hintText: "Password",
                        controller: controller.passwordEditingController,
                        val: (value) {
                          if (value == null) {
                            return "Password can not be null";
                          } else if (value.length <= 8) {
                            return "Password can not be less than 8";
                          } else {
                            return null;
                          }
                        }),
                    MyTextFormField(
                        hintText: "Re-Password",
                        controller: controller.password2EditingController,
                        val: (value) {
                          if (value == null) {
                            return "Please re-enter your password";
                          } else if (value !=
                              controller.passwordEditingController.text) {
                            return "Password mis-match";
                          } else {
                            return null;
                          }
                        }),
                    Container(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.saveDate();
                          }
                        },
                        child: Text("save"),
                      ),
                    )
                  ],
                )));
      }),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.val});

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) val;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: val,
      decoration: InputDecoration(
          hintText: hintText, border: const OutlineInputBorder()),
    );
  }
}
