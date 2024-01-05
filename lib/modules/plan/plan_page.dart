import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:todolist/modules/plan/plan_controller.dart';
import 'package:todolist/utils/helper_widgets.dart';
import 'package:todolist/utils/text_form_field.dart';

class PlanScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlanController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Plan"),
        ),
        body: SafeArea(
          child: Obx(() {
            return GridView.builder(
                itemCount: controller.plans.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemBuilder: (context, index) {
                  return Card(
                    shadowColor: Colors.red,
                    elevation: 20,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            ListTile(
                                title: Text(
                              controller.plans.elementAt(index).plan_name,
                            )),
                            ListTile(
                                leading: const Text("Start time"),
                                title: Text(
                                  _convertDatetimeToString(controller.plans
                                      .elementAt(index)
                                      .start_time),
                                )),
                            ListTile(
                                leading: const Text("End Time"),
                                title: Text(
                                  _convertDatetimeToString(controller.plans
                                      .elementAt(index)
                                      .end_time),
                                )),
                            ListTile(
                                leading: const Text("Created at"),
                                title: Text(
                                  _convertDatetimeToString(controller.plans
                                      .elementAt(index)
                                      .created_at!),
                                ))
                          ],
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: ButtonBar(children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.details))
                            ]))
                      ],
                    ),
                  );
                });
          }),
        ),
        floatingActionButton: IconButton(
          onPressed: () {
            _showCreatePlanDialog(controller);
          },
          icon: const Icon(Icons.add),
        ),
      );
    });
  }

  _showCreatePlanDialog(PlanController controller) {
    final _formKey = GlobalKey<FormState>();
    Get.defaultDialog(
        title: "Create Plan",
        content: Container(
          height: Get.height * 0.5,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(children: [
                MyTextFormField(
                    hintText: "Plan Name",
                    controller: controller.planNameEditingController,
                    val: (value) {
                      if (value == null) {
                        return "Plan name can not be empty";
                      }
                      return null;
                    },
                    obscure: false),
                columnHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Start Time"),
                    TextButton(onPressed: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (time) {
                        controller.startTime.value = time;
                      });
                    }, child: Obx(() {
                      return Text(controller.startTime.toString());
                    }))
                  ],
                ),
                columnHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("End Time"),
                    TextButton(onPressed: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (time) {
                        controller.endTime.value = time;
                      });
                    }, child: Obx(() {
                      return Text(controller.endTime.toString());
                    }))
                  ],
                ),
                columnHeight,
                OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.createPlan();
                      }
                    },
                    child: const Text("save"))
              ]),
            ),
          ),
        ));
  }

  String _convertDatetimeToString(DateTime time) {
    return "${time.day}/${time.month}/ ${time.year},  ${time.hour}:${time.minute}";
  }
}
