class Subject {
  late String ?id;
  late String ?name;
  Subject({required this.id, required this.name});
  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(id: json['id'], name: json['name']);
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
