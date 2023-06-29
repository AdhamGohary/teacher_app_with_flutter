class Student {
  late String id;
  late String name;
  late String imgUrl;
  late String phoneNumber;

  Student(
      {required this.id,
      required this.name,
      required this.imgUrl,
      required this.phoneNumber});
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
        id: json['id'],
        name: json['name'],
        imgUrl: json['imgUrl'],
        phoneNumber: json['phoneNumber']);
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'imgUrl': imgUrl,
      'phoneNumber': phoneNumber
    };
  }
}
