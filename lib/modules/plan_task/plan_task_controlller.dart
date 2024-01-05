import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/apis/task_api.dart';
import 'package:todolist/models/task.dart';

class PlanTaskController extends GetxController {
  var planId = Get.arguments["planId"];
  RxList<TaskModel> tasks = <TaskModel>[].obs;
  final taskApi = TaskApi();

  final taskNameEditingController = TextEditingController();
  Rx<DateTime> startTime = Rx<DateTime>(DateTime.now());
  Rx<DateTime> endTime = Rx<DateTime>(DateTime.now());

  @override
  void onInit() {
    getTaskPlan(planId);
    super.onInit();
  }

  getTaskPlan(planId) async {
    var res = await taskApi.getTaskList(planId);
    print(res);
    if (res != null) {
      res.forEach((item) {
        TaskModel task = TaskModel.fromJson(item);
        tasks.add(task);
      });
    }
    print(tasks.length);
  }

  createTask() async {
    var res = await taskApi.createTask(
        TaskModel(
                taskName: taskNameEditingController.text,
                startTIme: startTime.value,
                endTime: endTime.value)
            .toJson(),
        planId);
    if (res != null) {
      tasks.add(TaskModel.fromJson(res));
      Get.back();
    }
  }
}
