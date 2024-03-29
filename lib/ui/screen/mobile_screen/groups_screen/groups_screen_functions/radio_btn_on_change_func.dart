import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/view_model/student_view_model/student_view_model.dart';
import 'package:teacher_app/view_model/teacher_classes_view_model.dart/teacher_classes_view_model.dart';

radioBtnOnChangeFunc({
  required BuildContext context,
  required int index,
}) {
  Provider.of<StudentViewModel>(context, listen: false).classId =
      Provider.of<TeacherClassesViewModel>(context, listen: false)
          .classesId[index];
  Provider.of<TeacherClassesViewModel>(context, listen: false)
      .selectClassInGroupScreen = true;
}

