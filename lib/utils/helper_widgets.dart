import 'package:flutter/material.dart';
import 'package:get/get.dart';

SizedBox columnHeight = const SizedBox(
  height: 20,
);

showMessage(String title, String content) {
  Get.defaultDialog(title: title, content: Text(content));
}
