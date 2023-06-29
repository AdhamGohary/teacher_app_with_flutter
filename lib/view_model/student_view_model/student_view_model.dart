import 'package:flutter/material.dart';
import 'package:teacher_app/model/student.dart';
import 'package:teacher_app/repo/student_repo.dart';
import 'package:teacher_app/utils/functions/const_functions/print.dart';

class StudentViewModel extends ChangeNotifier {
  late StudentRepo studentRepo;
  List<Student>? classStudents = [];
  List<Student>? foundStudents;
  String classId = '';
  StudentViewModel({required this.studentRepo});
  Future<void> getStudentsByClassId({required String classId}) async {
    classStudents!.clear();
    List? list = await studentRepo.getStudentsByClassId(classId: classId);
    classStudents!.addAll(list!.map((item) => Student.fromJson(item)));
  }

  ///////////////////////////////////
  getStudent({required String keyWord}) {
    List<Student>? result = [];

    if (keyWord.isEmpty) {
      result = classStudents;
    } else {
      result = classStudents!
          .where((element) => element.name
              .toLowerCase()
              .trim()
              .contains(keyWord.toLowerCase().trim()))
          .toList();
    }

    foundStudents = result;
  }
}
