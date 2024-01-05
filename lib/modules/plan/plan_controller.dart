import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/apis/plan_api.dart';
import 'package:todolist/models/plan.dart';

class PlanController extends GetxController {
  final planNameEditingController = TextEditingController();
  Rx<DateTime> startTime = Rx<DateTime>(DateTime.now());
  Rx<DateTime> endTime = Rx<DateTime>(DateTime.now());
  @override
  void onInit() {
    getAllPlan();
    super.onInit();
  }

  RxList<Plan> plans = <Plan>[].obs;
  final planApi = PlanApi();

  getAllPlan() async {
    ;
    var res = await planApi.getAllPlan();
    if (res != null) {
      res.forEach((item) {
        Plan plan = Plan.fromJson(item);
        plans.add(plan);
      });
    }
  }

  createPlan() async {
    Plan plan = Plan(
        plan_name: planNameEditingController.text,
        start_time: startTime.value,
        end_time: endTime.value);

    var res = await planApi.createPlan(plan.toJson());
    print(res);
    if (res != null) {
      plans.add(Plan.fromJson(res));
    }
    Get.back();
  }

  deletePlan(id) async {
    var res = await planApi.deletePlan(id);
    if (res) {
      plans.removeWhere((element) => element.id == id);
    }
  }
}
