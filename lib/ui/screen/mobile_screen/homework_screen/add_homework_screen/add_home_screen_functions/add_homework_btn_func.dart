import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/model/home_work.dart';
import 'package:teacher_app/utils/functions/view_dialog.dart';
import 'package:teacher_app/view_model/home_work_view_model/home_work_view_model.dart';

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
  }
}

