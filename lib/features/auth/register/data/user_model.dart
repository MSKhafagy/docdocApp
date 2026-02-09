class UserModel {
  final String name;
  final String phone;
  final String email;
  final String gender;
  final String password;
  final String password_confirmation;

  UserModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.gender,
    required this.password,
    required this.password_confirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "email": email,
      "gender": gender,
      "password": password,
      "password_confirmation": password_confirmation,
    };
  }
}