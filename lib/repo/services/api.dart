import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher_app/model/teacher_table.dart';
import 'package:teacher_app/model/user.dart';
import 'package:teacher_app/repo/user_repo.dart';
import 'package:http/http.dart' as http;
import 'package:teacher_app/utils/functions/const_functions/print.dart';
// import 'package:teacher_app/token.js' as token;
import 'package:teacher_app/utils/constants/strings.dart';

class Api extends UserRepo {
  @override
  Future<void> login(User userNameAndPassword) async {
    try {
      var response = await http.post(
        Uri.parse('$url/login'),
        headers: {"content-type": "application/json"},
        body: jsonEncode(userNameAndPassword.toJson()),
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('statusCode', response.statusCode);
      prefs.setString('teacherInfo', response.body);
      checkDebugMode((response.body).runtimeType);
      checkDebugMode((jsonDecode(response.body)).runtimeType);
    } catch (e) {
      checkDebugMode(e);
    }
  }

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
      Uri.parse("$url/getTeacherTable/$teacherId"),
      /*SharedPreferences prefs = await SharedPreferences.getInstance();
    late String? mapTeacherInfoString;*/

      // try {
      // if (mapTeacherInfoString != null) {
      /*Map<String, dynamic> mapTeacherInfo = jsonDecode(mapTeacherInfoString);
        var teacherId = mapTeacherInfo['id'];*/

      /* headers: {
     "content-type": "application/json",
     "Authorization": 'Bearer ${token.getToken()}'
   },*/
    );
    teacherTable = jsonDecode(response.body);
    return teacherTable!;

    // checkDebugMode(jsonDecode(response.body));
    // TeacherTable.fromJson(teacherTable);

    // checkDebugMode(getToken());
    // body = jsonDecode(response.body);
    // checkDebugMode(response.body);
    // checkDebugMode(mapTeacherInfo);
    /*  } else {
        checkDebugMode('from else');
      }*/
    /* } catch (e) {
      checkDebugMode(e);
    }*/
  }
}
