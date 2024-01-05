import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/modules/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:todolist/modules/tasks/task_controller.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: BottomNavBarWidget(),
      );
    });
  }
}
