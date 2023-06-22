class User {
  late String email;
  late String password;
  late String? id;
  User({required this.email, required this.password ,  this.id});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'], id: json['_id']
    );
  }

  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }
}
