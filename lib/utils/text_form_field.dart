import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.val,
      required this.obscure});

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) val;
  final bool obscure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: val,
      obscureText: obscure,
      decoration: InputDecoration(
          hintText: hintText, border: const OutlineInputBorder()),
    );
  }
}
