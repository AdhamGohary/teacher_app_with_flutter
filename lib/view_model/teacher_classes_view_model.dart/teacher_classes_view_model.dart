import 'package:flutter/material.dart';
import 'package:teacher_app/model/teacher_classes.dart';
import 'package:teacher_app/repo/classes_repo.dart';

class TeacherClassesViewModel extends ChangeNotifier {
  late ClassesRepo classesRepo;
  List<TeacherClasses>? teacherClasses = [];
  List<String> gradesName = [];
  List<String> gradesId = [];
  List<String> classesName = [];
  List<String> classesId = [];
  List<String> subjectsName = [];
  List<String> subjectsId = [];
  bool selectClassInGroupScreen = false;
//////////////////////////////////////////////////////////
  TeacherClassesViewModel({required this.classesRepo});
 ////////////////////////////////////////////////////////// 
  getTeacherClasses() async {
    teacherClasses!.clear();
    List? list = await classesRepo.getTeacherClasses();
    teacherClasses!.addAll(list!.map((item) => TeacherClasses.fromJson(item)));

    for (var element in teacherClasses!) {
      if (!gradesName.contains(element.gradeName) &&
          !gradesId.contains(element.gradeId)) {
        gradesName.add(element.gradeName);
        gradesId.add(element.gradeId);
      }
      if (!classesName.contains(element.className) &&
          !classesId.contains(element.classId)) {
        classesName.add(element.className);
        classesId.add(element.classId);
      }
      if (!subjectsName.contains(element.subjectName) &&
          !subjectsId.contains(element.subjectId)) {
        subjectsName.add(element.subjectName);
        subjectsId.add(element.subjectId);
      }
    }
    notifyListeners();
  }
}
