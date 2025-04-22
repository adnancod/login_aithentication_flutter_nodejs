class UserSignupModel {
  final String? id;         // MongoDB _id field
  final String? username;
  final String email;
  final String password;

  UserSignupModel({
    this.id,
    this.username,
    required this.email,
    required this.password,
  });

  // Convert JSON to Dart object
  factory UserSignupModel.fromJson(Map<String, dynamic> json) {
    return UserSignupModel(
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  // Convert Dart object to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
