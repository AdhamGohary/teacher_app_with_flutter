import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher_app/repo/table_repo.dart';
import 'package:teacher_app/utils/constants/strings.dart';

class TableApi implements TableRepo {
  
  @override
  Future<List>? getTeacherTable() async {
    late List? teacherTable;
    late String teacherId;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? mapTeacherInfoString = prefs.getString('teacherInfo');
    if (mapTeacherInfoString != null) {
      Map<String, dynamic> mapTeacherInfo = jsonDecode(mapTeacherInfoString);
      teacherId = mapTeacherInfo['id'];
    }
    http.Response response = await http.get(
      Uri.parse("$teacherUrl/getTeacherTable/$teacherId"),
    );
    teacherTable = jsonDecode(response.body);
    return teacherTable!;
  }
}
