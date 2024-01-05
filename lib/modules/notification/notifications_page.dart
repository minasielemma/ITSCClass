import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:todolist/modules/notification/notifcaitions_controller.dart';

class NotifactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
        ),
        body: Obx(() {
          return ListView.builder(
              itemCount: controller.events.length,
              itemBuilder: (context, index) {
                return Text(controller.events.elementAt(index));
              });
        }),
      );
    });
  }
}
