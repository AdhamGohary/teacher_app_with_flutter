import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher_app/model/home_work.dart';
import 'package:teacher_app/repo/home_work_repo.dart';
import 'package:teacher_app/utils/constants/strings.dart';
import 'package:teacher_app/utils/functions/print.dart';

class HomeWorkApi implements HomeWorkRepo {
  @override
  Future<void> addHomeWork(HomeWork homeWork) async {
    try {
      await http.post(Uri.parse('$teacherUrl/addHomeWork'),
          headers: {'content-type': 'application/json'},
          body: jsonEncode(homeWork));
    } catch (e) {
      checkDebugMode(e);
    }
  }

///////////////////////////////////////////////////////////////
  @override
  Future<List>? getAllHomeWorks() async {
    List? allHomeWorks;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? teacherInfoString = prefs.getString('teacherInfo');
      late Map<String, dynamic> teacherInfoMap;
      late String teacherId;
      if (teacherInfoString != null) {
        teacherInfoMap = jsonDecode(teacherInfoString);
        teacherId = teacherInfoMap['id'];
      }
      http.Response response =
          await http.get(Uri.parse('$teacherUrl/getAllHomeWorks/$teacherId'));
      allHomeWorks = jsonDecode(response.body);
    } catch (e) {
      checkDebugMode(e);
    }
    return allHomeWorks!;
  }
}
