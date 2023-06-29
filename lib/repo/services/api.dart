import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher_app/model/home_work.dart';
import 'package:teacher_app/model/user.dart';
import 'package:teacher_app/repo/home_work_repo.dart';
import 'package:teacher_app/repo/student_repo.dart';
import 'package:teacher_app/repo/user_repo.dart';
import 'package:http/http.dart' as http;
import 'package:teacher_app/utils/functions/const_functions/print.dart';
import 'package:teacher_app/utils/constants/strings.dart';

class Api extends UserRepo with HomeWorkRepo, StudentRepo {
  @override
  Future<void> login(User userNameAndPassword) async {
    try {
      var response = await http.post(
        Uri.parse('$teacherUrl/login'),
        headers: {"content-type": "application/json"},
        body: jsonEncode(userNameAndPassword),
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('statusCode', response.statusCode);
      prefs.setString('teacherInfo', response.body);
    } catch (e) {
      checkDebugMode(e);
    }
  }

/////////////////////////////////////////////////////////
  @override
  Future<void> addHomeWork(HomeWork homeWork) async {
    try {
      await http.post(
          Uri.parse('$teacherUrl/addHomeWork'),
          headers: {'content-type': 'application/json'},
          body: jsonEncode(homeWork));
    } catch (e) {
      checkDebugMode(e);
    }
  }

///////////////////////////////////////////////////////////////
  @override
  Future<List>? getAllHomeWorks() async {
    List? allHomeWorks ;
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

//////////////////////////////////////////////////////////////
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

////////////////////////////////////////
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

  ///////////////////////////////////////////
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
