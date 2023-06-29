import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher_app/model/home_work.dart';
import 'package:teacher_app/repo/home_work_repo.dart';

class HomeWorkViewModel extends ChangeNotifier {
  late HomeWorkRepo homeWorkRepo;
  late String teacherId;
  List<HomeWork>? allHomeWorks = [];
  String gradeId = '6437015fc369cbd36656e597';
  String classId = '6437018bc369cbd36656e6a8';
  String subjectId = '64308708076f29465c759de7';

  HomeWorkViewModel({required this.homeWorkRepo});
  Future<void> addHomeWork(HomeWork homeWork) async {
    await homeWorkRepo.addHomeWork(homeWork);
    notifyListeners();
  }

/////////////////////////////////////////////////////
  Future<void> getAllHomeWorks() async {
    allHomeWorks!.clear();
    List? list = await homeWorkRepo.getAllHomeWorks();
    allHomeWorks!.addAll(list!.map((item) => HomeWork.fromJson(item)));
    notifyListeners();
  }

/////////////////////////////////////////////////////
  Future<String> getTeacherId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? teacherInfoString = prefs.getString('teacherInfo');
    if (teacherInfoString != null) {
      Map<String, dynamic> teacherInfoMap = jsonDecode(teacherInfoString);
      teacherId = teacherInfoMap['id'];
    }

    return teacherId;
  }
}
