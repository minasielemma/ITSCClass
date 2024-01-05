import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/modules/bottom_nav_bar/bottom_nav_bar_controller.dart';

class BottomNavBarWidget extends StatefulWidget {
  @override
  State createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(
        init: BottomNavBarController(),
        builder: (controller) {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Plans"),
              BottomNavigationBarItem(
                icon: Icon(Icons.task),
                label: "Task",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notification_add), label: "Notifications"),
              BottomNavigationBarItem(icon: Icon(Icons.task), label: "Account")
            ],
            currentIndex: controller.selectedIndex.value,
            onTap: (value) {
              controller.changeSelectedIndex(value);
            },
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.blue,
            unselectedLabelStyle: const TextStyle(
                color: Colors.amber, fontWeight: FontWeight.w900),
            selectedLabelStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          );
        });
  }
}
