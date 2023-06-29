import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/model/home_work.dart';
import 'package:teacher_app/ui/screen/mobile_screen/homework_screen/add_homework_screen/add_homework_screen.dart';
import 'package:teacher_app/utils/functions/const_functions/navigate_with_slide_transtion_fun.dart';
import 'package:teacher_app/utils/functions/const_functions/view_dialog.dart';
import 'package:teacher_app/view_model/home_work_view_model/home_work_view_model.dart';
import 'package:teacher_app/view_model/teacher_classes_view_model.dart/teacher_classes_view_model.dart';

addHomeworkBtnFunc(
    {required BuildContext context,
    required String title,
    required String desc,
    required String classId,
    required String grade,
    required String subject,
    required String teacher})  {
  if (title.isEmpty || desc.isEmpty) {
    viewDialog(
        context: context,
        dialogType: DialogType.error,
        btnOkTxt: 'حسنا',
        btnCancelTxt: 'إغلاق',
        title: 'عملية فاشلة',
        content: 'يرجي ملئ جميع الحقول الفارغة',
        backgroundColor: Colors.white,
        btnCancelFunc: () => Navigator.of(context).pop(),
        btnOkFunc: () => Navigator.of(context).pop());
  } else {
     context.read<HomeWorkViewModel>().addHomeWork(HomeWork(
          title: title,
          desc: desc,
          classId: classId,
          grade: grade,
          subject: subject,
          teacher: teacher,
        ));
     context.read<HomeWorkViewModel>().getAllHomeWorks();

    viewDialog(
        context: context,
        dialogType: DialogType.success,
        btnOkTxt: 'حسنا',
        btnCancelTxt: 'إغلاق',
        title: 'عملية ناجحة',
        content: 'تم إضافة الواجب بنجاح ',
        backgroundColor: Colors.white,
        btnCancelFunc: () {
          Navigator.of(context).pop();
        },
        btnOkFunc: () {
          Navigator.of(context).pop();
        });
    // ignore: use_build_context_synchronously
  }
}

//////////////////////////////////////////////////////////////////////
void stageSelectOnTapFunc(
    {required BuildContext context, required String stageVlaue}) {
  late int indexOfStage;
  indexOfStage = Provider.of<TeacheClassesViewModel>(context, listen: false)
      .gradesName
      .indexOf(stageVlaue);

  Provider.of<HomeWorkViewModel>(context, listen: false).gradeId =
      Provider.of<TeacheClassesViewModel>(context, listen: false)
          .gradesId[indexOfStage];
}

//////////////////////////////////////////////////////////////////////
void classSelectOnTapFunc(
    {required BuildContext context, required String classValue}) {
  late int indexOfclass;
  indexOfclass = Provider.of<TeacheClassesViewModel>(context, listen: false)
      .classesName
      .indexOf(classValue);

  Provider.of<HomeWorkViewModel>(context, listen: false).classId =
      Provider.of<TeacheClassesViewModel>(context, listen: false)
          .classesId[indexOfclass];
}

//////////////////////////////////////////////////////////////////////
void subjectSelectOnTapFunc(
    {required BuildContext context, required String subjectValue}) {
  late int indexOfsubject;
  indexOfsubject = Provider.of<TeacheClassesViewModel>(context, listen: false)
      .subjectsName
      .indexOf(subjectValue);
  Provider.of<HomeWorkViewModel>(context, listen: false).subjectId =
      Provider.of<TeacheClassesViewModel>(context, listen: false)
          .subjectsId[indexOfsubject];
}

/////////////////////////////////////////////////////////////////////
floatingActionBtnfunc({required BuildContext context}) {
  navigateWithSlideTranstionFun(
      context: context, nextScreen: const AddHomework(), xBegin: 0, yBegin: 1);
}
