import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/view_model/home_work_view_model/home_work_view_model.dart';
import 'package:teacher_app/view_model/teacher_classes_view_model.dart/teacher_classes_view_model.dart';

void subjectSelectOnTapFunc(
    {required BuildContext context, required String subjectValue}) {
  late int indexOfsubject;
  indexOfsubject = Provider.of<TeacherClassesViewModel>(context, listen: false)
      .subjectsName
      .indexOf(subjectValue);
  Provider.of<HomeWorkViewModel>(context, listen: false).subjectId =
      Provider.of<TeacherClassesViewModel>(context, listen: false)
          .subjectsId[indexOfsubject];
}
