import 'package:todolist/models/user_account.dart';

class Plan {
  String plan_name;
  DateTime start_time;
  DateTime end_time;
  UserAccount? owner;
  DateTime? created_at;
  DateTime? modified_at;

  Plan(
      {required this.plan_name,
      required this.start_time,
      required this.end_time,
      this.created_at,
      this.modified_at,
      this.owner});

  factory Plan.fromJson(var json) {
    return Plan(
        plan_name: json["plan_name"],
        start_time: json["start_time"],
        end_time: json["start_time"],
        created_at: json["created_at"] == null ? null : json["created_at"],
        modified_at: json["modified_at"],
        owner: UserAccount.fromJson(json["owner"]));
  }

  Map<String, dynamic> toJson() {
    return {
      "plan_name": plan_name,
      "start_time": start_time,
      "end_time": end_time
    };
  }
}
