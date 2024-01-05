import 'package:todolist/models/user_account.dart';

class Plan {
  int? id;
  String plan_name;
  DateTime start_time;
  DateTime end_time;
  UserAccount? owner;
  DateTime? created_at;
  DateTime? modified_at;

  Plan(
      {required this.plan_name,
      this.id,
      required this.start_time,
      required this.end_time,
      this.created_at,
      this.modified_at,
      this.owner});

  factory Plan.fromJson(var json) {
    return Plan(
        id: json["id"],
        plan_name: json["plan_name"],
        start_time: DateTime.parse(json["start_time"]),
        end_time: DateTime.parse(json["end_time"]),
        created_at: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        modified_at: DateTime.parse(json["modified_at"]),
        owner: UserAccount.fromJson(json["owner"]));
  }

  Map<String, dynamic> toJson() {
    return {
      "plan_name": plan_name,
      "start_time": start_time.toIso8601String(),
      "end_time": end_time.toIso8601String()
    };
  }
}
