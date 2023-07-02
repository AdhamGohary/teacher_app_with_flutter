import 'package:flutter/material.dart';
import 'package:teacher_app/model/teacher_table.dart';
import 'package:teacher_app/repo/user_repo.dart';

enum DaysOfWeek { sat, sun, mon, tus, wed, thr, fri }

class TeacherTableViewModel extends ChangeNotifier {
  late UserRepo userRepo;
  List<TeacherTable>? teacherTable = [];
  TeacherTableViewModel({required this.userRepo});
  Future<void>? getTeacherTable() async {
    teacherTable!.clear();
    List? list = await userRepo.getTeacherTable();
    teacherTable!
        .addAll(list!.map((item) => TeacherTable.fromJson(item)).toList());

    notifyListeners();
  }

  List<Map<String, dynamic>> selectDay = [];
  int selectDayIndex = 0;
  List<TeacherTable>? subjectsOfSelectDay = [];
}
