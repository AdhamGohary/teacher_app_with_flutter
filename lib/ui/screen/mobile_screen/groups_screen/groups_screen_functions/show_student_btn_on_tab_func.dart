import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/ui/screen/mobile_screen/groups_screen/show_students_screen/show_students.dart';
import 'package:teacher_app/utils/functions/navigate_with_slide_transtion_fun.dart';
import 'package:teacher_app/view_model/student_view_model/student_view_model.dart';
import 'package:teacher_app/view_model/teacher_classes_view_model.dart/teacher_classes_view_model.dart';

showStudentBtnOnTabFunc(
    {required BuildContext context,
    String? nameOfClass,
    required String classId}) async {
  if (Provider.of<TeacherClassesViewModel>(context, listen: false)
          .selectClassInGroupScreen ==
      true) {
    await context
        .read<StudentViewModel>()
        .getStudentsByClassId(classId: classId);
    navigateWithSlideTranstionFun(
        context: context,
        nextScreen: ShowStudents(
          nameOfClass: nameOfClass,
        ),
        xBegin: 0,
        yBegin: 1);

    // ignore: use_build_context_synchronously
    Provider.of<TeacherClassesViewModel>(context, listen: false)
        .selectClassInGroupScreen = false;
  }
}
