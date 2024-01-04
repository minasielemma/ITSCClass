import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/modules/plan/plan_controller.dart';

class PlanScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlanController>(builder: (controller) {
      return Scaffold();
    });
  }
}
