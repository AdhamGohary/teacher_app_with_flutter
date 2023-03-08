import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/ui/screen/mobile_screen/groups_screen/show_students/show_students.dart';
import 'package:teacher_app/utils/functions/const_functions/navigate_with_slide_transtion_fun.dart';
import 'package:teacher_app/view_model/class_stage_subject_data_view_model/class_stage_subject_data_view_model.dart';

showStudentBtnOnTabFunc(
    {required BuildContext context, required String? nameOfClass}) {
  if (Provider.of<ClassStageSubjectDataViewModel>(context, listen: false)
          .selectClassInGroupScreen ==
      true) {
    navigateWithSlideTranstionFun(
        context: context,
        nextScreen: ShowStudents(
          nameOfClass: nameOfClass,
        ),
        xBegin: 0,
        yBegin: 1);

    Provider.of<ClassStageSubjectDataViewModel>(context, listen: false)
        .selectClassInGroupScreen = false;
  } else {}
}

radioBtnOnChangeFunc({required BuildContext context, required int index}) {
  Provider.of<ClassStageSubjectDataViewModel>(context, listen: false)
          .firstSelectClass =
      Provider.of<ClassStageSubjectDataViewModel>(context, listen: false)
          .dataOfClassStageSubject[index]['studentData'];
  Provider.of<ClassStageSubjectDataViewModel>(context, listen: false)
          .selectClass =
      Provider.of<ClassStageSubjectDataViewModel>(context, listen: false)
          .dataOfClassStageSubject[index]['studentData'];
  Provider.of<ClassStageSubjectDataViewModel>(context, listen: false)
      .selectClassInGroupScreen = true;
}
