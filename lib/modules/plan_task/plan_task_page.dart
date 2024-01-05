import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:todolist/modules/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:todolist/modules/plan_task/plan_task_controlller.dart';
import 'package:todolist/modules/tasks/task_controller.dart';
import 'package:todolist/utils/helper_widgets.dart';
import 'package:todolist/utils/text_form_field.dart';

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
        body: SingleChildScrollView(
          child: Obx(() {
            return ListView.builder(
                itemCount: controller.tasks.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Text(controller.tasks.elementAt(index).taskName);
                });
          }),
        ),
        floatingActionButton: IconButton(
          onPressed: () {
            _showCreateTaskDialog(controller);
          },
          icon: const Icon(Icons.add),
        ),
      );
    });
  }

  _showCreateTaskDialog(PlanTaskController controller) {
    final _formKey = GlobalKey<FormState>();
    Get.defaultDialog(
        title: "Create Task",
        content: Container(
          height: Get.height * 0.5,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(children: [
                MyTextFormField(
                    hintText: "Task Name",
                    controller: controller.taskNameEditingController,
                    val: (value) {
                      if (value == null) {
                        return "Task name can not be empty";
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
                        controller.createTask();
                      }
                    },
                    child: const Text("save"))
              ]),
            ),
          ),
        ));
  }
}
