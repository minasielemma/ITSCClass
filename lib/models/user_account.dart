class UserAccount {
  int? id;
  String first_name;
  String last_name;
  String username;
  String? password1;
  String? password2;
  String email;

  UserAccount(
      {required this.first_name,
      required this.last_name,
      required this.username,
      this.password1,
      this.password2,
      required this.email,
      this.id});
  factory UserAccount.fromJson(Map<String, dynamic> json) {
    return UserAccount(
        id: json["id"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        username: json["username"],
        email: json["email"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "first_name": first_name,
      "last_name": last_name,
      "password": password1,
      "password2": password2,
      "email": email,
      "username": username
    };
  }
}
