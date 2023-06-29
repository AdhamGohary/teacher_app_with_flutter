import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/ui/screen/mobile_screen/groups_screen/show_students/show_students.dart';
import 'package:teacher_app/ui/screen/mobile_screen/homework_screen/homework_screen.dart';
import 'package:teacher_app/utils/functions/const_functions/navigate_with_slide_transtion_fun.dart';
import 'package:teacher_app/utils/functions/const_functions/print.dart';
import 'package:teacher_app/view_model/student_view_model/student_view_model.dart';
import 'package:teacher_app/view_model/teacher_classes_view_model.dart/teacher_classes_view_model.dart';

showStudentBtnOnTabFunc(
    {required BuildContext context,
     String ?nameOfClass,
    required String classId}) async{
  if (Provider.of<TeacheClassesViewModel>(context, listen: false)
          .selectClassInGroupScreen ==
      true) {
   await context.read<StudentViewModel>().getStudentsByClassId(classId: classId);
    navigateWithSlideTranstionFun(
        context: context,
        nextScreen: ShowStudents(
          nameOfClass: nameOfClass,
        ),
        xBegin: 0,
        yBegin: 1);

    Provider.of<TeacheClassesViewModel>(context, listen: false)
        .selectClassInGroupScreen = false;
    
  } else {}
}

showHomeworkBtnOnTabFunc({required BuildContext context}) {
  if (Provider.of<TeacheClassesViewModel>(context, listen: false)
          .selectClassInGroupScreen ==
      true) {
    navigateWithSlideTranstionFun(
        context: context,
        nextScreen: const HomeworkScreen(),
        xBegin: 0,
        yBegin: 1);
  } else {}
}

radioBtnOnChangeFunc({
  required BuildContext context,
  required int index,
}) {
  Provider.of<StudentViewModel>(context, listen: false).classId =
      Provider.of<TeacheClassesViewModel>(context, listen: false)
          .classesId[index];

  Provider.of<TeacheClassesViewModel>(context, listen: false)
      .selectClassInGroupScreen = true;
}
