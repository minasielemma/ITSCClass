import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/modules/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:todolist/modules/plan_task/plan_task_controlller.dart';

class PlanTaskPage extends StatefulWidget {
  const PlanTaskPage({super.key});

  @override
  State createState() => _PlanTaskState();
}

class _PlanTaskState extends State<PlanTaskPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlanTaskController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: BottomNavBarWidget(),
        appBar: AppBar(),
      );
    });
  }
}
