import 'package:teacher_app/model/class_name.dart';
import 'package:teacher_app/model/subject.dart';

class TeacherTable {
  late String id;
  late ClassName? className;
  late int day;
  late Subject? subject;
  late String startAt;
  late String endAt;
  late String gradeName;
  TeacherTable(
      {required this.id,
      required this.className,
      required this.day,
      required this.subject,
      required this.startAt,
      required this.endAt,
      required this.gradeName});

  factory TeacherTable.fromJson(Map<String, dynamic> json) {
    return TeacherTable(
        id: json['_id'],
        className: ClassName.fromJson(json['classId']),
        day: json['day'],
        subject: Subject.fromJson(json['subject']),
        startAt: json['startAt'],
        endAt: json['endAt'],
        gradeName: json['gradeName']);
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'classId': className,
      'day': day,
      'subject': subject,
      'startAt': startAt,
      'endAt': endAt,
      'gradName': gradeName
    };
  }
}
