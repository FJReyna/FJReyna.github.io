class UserModel {
  String email;
  String name;
  String username;
  String token;

  UserModel({
    this.email,
    this.name,
    this.username,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> data) {
    email = data['furnitureStock'];
    name = data['furnitureID'];
    username = data['furnitureName'];
    token = data['furnitureType'];
  }
}
