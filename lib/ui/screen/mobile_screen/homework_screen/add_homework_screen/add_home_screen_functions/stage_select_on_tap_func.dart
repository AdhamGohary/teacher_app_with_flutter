import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/view_model/home_work_view_model/home_work_view_model.dart';
import 'package:teacher_app/view_model/teacher_classes_view_model.dart/teacher_classes_view_model.dart';

void stageSelectOnTapFunc(
    {required BuildContext context, required String stageVlaue}) {
  late int indexOfStage;
  indexOfStage = Provider.of<TeacherClassesViewModel>(context, listen: false)
      .gradesName
      .indexOf(stageVlaue);

  Provider.of<HomeWorkViewModel>(context, listen: false).gradeId =
      Provider.of<TeacherClassesViewModel>(context, listen: false)
          .gradesId[indexOfStage];
}
