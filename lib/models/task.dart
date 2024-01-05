import 'package:todolist/models/plan.dart';

class TaskModel {
  int? id;
  Plan? plan;
  String taskName;
  DateTime? createdAt;
  DateTime? modifiedAt;
  DateTime startTIme;
  DateTime endTime;

  TaskModel(
      {this.id,
      this.plan,
      required this.taskName,
      required this.startTIme,
      required this.endTime,
      this.createdAt,
      this.modifiedAt});

  factory TaskModel.fromJson(var json) {
    return TaskModel(
        taskName: json["task_name"],
        startTIme: json["start_time"],
        endTime: json["end_time"],
        plan: Plan.fromJson(json["plan"]),
        createdAt: json["created_at"],
        modifiedAt: json["modified_At"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "task_name": taskName,
      "start_time": startTIme.toIso8601String(),
      "end_time": endTime.toIso8601String()
    };
  }
}
