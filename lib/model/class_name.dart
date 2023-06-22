class ClassName {
  late String ?id;
  late String ?name;
  ClassName({required this.id, required this.name});
  factory ClassName.fromJson(Map<String, dynamic> json) {
    return ClassName(id: json['id'], name: json['name']);
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
