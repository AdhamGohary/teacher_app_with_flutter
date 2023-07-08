import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/view_model/home_work_view_model/home_work_view_model.dart';
import 'package:teacher_app/view_model/teacher_classes_view_model.dart/teacher_classes_view_model.dart';

void classSelectOnTapFunc(
    {required BuildContext context, required String classValue}) {
  late int indexOfClass;
  indexOfClass = Provider.of<TeacherClassesViewModel>(context, listen: false)
      .classesName
      .indexOf(classValue);

  Provider.of<HomeWorkViewModel>(context, listen: false).classId =
      Provider.of<TeacherClassesViewModel>(context, listen: false)
          .classesId[indexOfClass];
}