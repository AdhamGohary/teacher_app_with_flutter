import 'package:flutter/material.dart';
import 'package:teacher_app/model/student.dart';
import 'package:teacher_app/repo/student_repo.dart';

class StudentViewModel extends ChangeNotifier {
  late StudentRepo studentRepo;
  List<Student>? classStudents = [];
  List<Student>? foundStudents;
  final detailsOfStudent = ['الصورة', 'الاسم', 'رقم ولى الأمر', 'محادثة'];
  String classId = '6437018bc369cbd36656e6a8';
  //////////////////////////////////////////////
  StudentViewModel({required this.studentRepo});
  //////////////////////////////////////////////////
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
