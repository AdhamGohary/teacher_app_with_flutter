import 'package:flutter/material.dart';
import 'package:teacher_app/model/teacher_table.dart';
import 'package:teacher_app/repo/table_repo.dart';

enum DaysOfWeek { sat, sun, mon, tus, wed, thr, fri }

class TeacherTableViewModel extends ChangeNotifier {
  late TableRepo tableRepo;
  List<TeacherTable>? teacherTable = [];
  List<Map<String, dynamic>> selectDay = [];
  int selectDayIndex = 0;
  List<TeacherTable>? subjectsOfSelectDay = [];
  ////////////////////////////////////////////////////
  TeacherTableViewModel({required this.tableRepo});
  /////////////////////////////////////////////////////
  Future<void>? getTeacherTable() async {
    teacherTable!.clear();
    List? list = await tableRepo.getTeacherTable();
    teacherTable!
        .addAll(list!.map((item) => TeacherTable.fromJson(item)).toList());

    notifyListeners();
  }
}
