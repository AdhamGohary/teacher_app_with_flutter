import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher_app/repo/classes_repo.dart';
import 'package:teacher_app/utils/constants/strings.dart';
import 'package:teacher_app/utils/functions/print.dart';

class ClassesApi implements ClassesRepo {
  @override
  Future<List>? getTeacherClasses() async {
    late List? teacherClasses;
    late String teacherId;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? mapTeacherInfoString = prefs.getString('teacherInfo');
      if (mapTeacherInfoString != null) {
        Map<String, dynamic> mapTeacherInfo = jsonDecode(mapTeacherInfoString);
        teacherId = mapTeacherInfo['id'];
      }

      http.Response response =
          await http.get(Uri.parse('$teacherUrl/getTeacherClasses/$teacherId'));
      teacherClasses = jsonDecode(response.body);
    } catch (e) {
      checkDebugMode(e);
    }
    return teacherClasses!;
  }
}
