class UserModel {
  String id;
  String email;
  String name;
  String username;
  String token;
  List<String> roles;

  UserModel({
    this.id,
    this.email,
    this.name,
    this.username,
    this.token,
    this.roles,
  });

  UserModel.fromJson(Map<String, dynamic> data) {
    id = data['userID']?? '';
    email = data['userEmail']?? '';
    name = data['userName']?? '';
    username = data['userUsername']?? '';
    token = data['token']?? '';
    roles = data['userRoles']?? '';
  }
}
