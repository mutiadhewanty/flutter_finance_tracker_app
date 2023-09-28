class UserModel {
  const UserModel({this.id, required this.username, required this.password});

  final int? id;
  final String username;
  final String password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'], username: json['username'], password: json['password']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'username': username, 'password': password};
}
