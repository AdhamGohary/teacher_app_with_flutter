import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teacher_app/model/class_name.dart';
import 'package:teacher_app/model/subject.dart';
import 'package:teacher_app/model/teacher_table.dart';
import 'package:teacher_app/model/user.dart';
import 'package:teacher_app/repo/user_repo.dart';
import 'package:teacher_app/utils/functions/const_functions/print.dart';

class TeacherTableViewModel extends ChangeNotifier {
  late UserRepo userRepo;
  List<TeacherTable>? teacherTable = [];
  TeacherTableViewModel({required this.userRepo});
  Future<void>? getTeacherTable() async {
    List? list = await userRepo.getTeacherTable();
    checkDebugMode('from viewmodel list is $list');
    teacherTable!
        .addAll(list!.map((item) => TeacherTable.fromJson(item)).toList());
    checkDebugMode(teacherTable![0].className!.name);
    notifyListeners();
  }

  List<String> daysOfWeek = ['SAT', 'SUN', 'MON', 'TUS', 'WED', 'THR', 'FRI'];
  List<Map<String, dynamic>> selectDay = [];
  int selectDayIndex = 0;
  List<TeacherTable>? subjectsOfSelectDay = [TeacherTable(
    id: '',
    className: ClassName(id: '', name: 'أ'),
    day: 0,
    subject: Subject(id: '', name: 'اللغة الانجليزية'),
    startAt: '2023-04-25T12:33:45.737Z',
    endAt: '2023-04-25T12:33:45.737Z',
    gradeName: ''),
TeacherTable(
    id: '',
    className: ClassName(id: '', name: 'أ'),
    day: 0,
    subject: Subject(id: '', name: 'اللغة الانجليزية'),
    startAt: '2023-04-25T12:43:45.737Z',
    endAt: '2023-04-25T12:43:45.737Z',
    gradeName: ''),];
}
