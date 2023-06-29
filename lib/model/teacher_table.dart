import 'package:teacher_app/model/class_name.dart';
import 'package:teacher_app/model/subject.dart';

class TeacherTable {
  late String id;
  late ClassName className;
  late int day;
  late Subject subject;
  late String time;
  // late String endAt;
  late String gradeName;
  TeacherTable(
      {required this.id,
      required this.className,
      required this.day,
      required this.subject,
      required this.time,
      // required this.endAt,
      required this.gradeName});

  factory TeacherTable.fromJson(Map<String, dynamic> json) {
    return TeacherTable(
        id: json['_id'],
        className: ClassName.fromJson(json['classId']),
        day: json['day'],
        time: json['time'],
        subject: Subject.fromJson(json['subject']),
        // endAt: json['endAt'],
        gradeName: json['gradeName']);
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'classId': className,
      'day': day,
      'subject': subject,
      'time': time,
      // 'endAt': endAt,
      'gradName': gradeName
    };
  }
}
