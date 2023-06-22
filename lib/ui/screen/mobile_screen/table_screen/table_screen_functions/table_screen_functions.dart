import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/view_model/teacher_table_view_model/teacher_table_view_model.dart';

selectDayOnBtnFunc({required BuildContext context, required int index}) {
  Provider.of<TeacherTableViewModel>(context, listen: false).selectDayIndex =
      index;
  Provider.of<TeacherTableViewModel>(context, listen: false)
      .subjectsOfSelectDay = [];
  for (int i = 0;
      i <
          Provider.of<TeacherTableViewModel>(context, listen: false)
              .teacherTable!
              .length;
      i++) {
    if (index ==
        Provider.of<TeacherTableViewModel>(context, listen: false)
            .teacherTable![i]
            .day) {
      Provider.of<TeacherTableViewModel>(context, listen: false)
          .subjectsOfSelectDay!
          .add(Provider.of<TeacherTableViewModel>(context, listen: false)
              .teacherTable![i]);
    }
  }
}
