import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher_app/model/user.dart';
import 'package:teacher_app/repo/auth_repo.dart';

class UserDataViewModel extends ChangeNotifier {
  late AuthRepo authRepo;
  var teacherId = '';
//////////////////////////////////////
  UserDataViewModel({required this.authRepo});
//////////////////////////////////////
  Future<void> login(User user) async {
    await authRepo.login(user);
    notifyListeners();
  }

  Future<String> getTeacherId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? teacherInfoString = prefs.getString('teacherInfo');
    if (teacherInfoString != null) {
      Map<String, dynamic> teacherInfoMap = jsonDecode(teacherInfoString);
      teacherId = teacherInfoMap['id'];
    }
    notifyListeners();
    return teacherId;
  }
}
