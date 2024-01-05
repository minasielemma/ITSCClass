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
        startTIme: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        plan: Plan.fromJson(json["plan"]),
        createdAt: DateTime.parse(json["created_at"]),
        modifiedAt: DateTime.parse(json["modified_at"]));
  }

  Map<String, dynamic> toJson() {
    return {
      "task_name": taskName,
      "start_time": startTIme.toIso8601String(),
      "end_time": endTime.toIso8601String()
    };
  }
}
