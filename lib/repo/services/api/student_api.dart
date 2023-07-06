import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teacher_app/repo/student_repo.dart';
import 'package:teacher_app/utils/functions/print.dart';
import 'package:teacher_app/utils/constants/strings.dart';

class StudentApi implements StudentRepo {
  @override
  Future<List>? getStudentsByClassId({required String classId}) async {
    late List? classStudents;
    try {
      http.Response respnse = await http
          .get(Uri.parse('$studentUrl/getStudentsByClassId/$classId'));
      classStudents = jsonDecode(respnse.body);
    } catch (e) {
      checkDebugMode(e);
    }
    return classStudents!;
  }
}
