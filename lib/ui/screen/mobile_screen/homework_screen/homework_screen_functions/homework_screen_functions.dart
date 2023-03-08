import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/utils/functions/const_functions/print.dart';
import 'package:teacher_app/utils/functions/const_functions/view_dialog.dart';
import 'package:teacher_app/view_model/homework_data_view_model/homework_data_view_model.dart';

late bool falg;
addHomeworkBtnFunc({required BuildContext context}) {
  if (stageSelectOnTapFunc(
              keyWord:
                  Provider.of<HomeworkDataViewModel>(listen: false, context)
                      .selectKeyWord,
              context: context) ==
          true &&
      classSelectOnTapFunc(
              keyWord:
                  Provider.of<HomeworkDataViewModel>(listen: false, context)
                      .selectKeyWord,
              context: context) ==
          true &&
      subjectSelectOnTapFunc(
              keyWord:
                  Provider.of<HomeworkDataViewModel>(listen: false, context)
                      .selectKeyWord,
              context: context) ==
          true) {
    checkDebugMode('from stageSelectIsTrue');
    viewDialog(
        context: context,
        title: 'عملية ناجحة',
        content: 'تم إضافة الواجب بنجاح',
        btnOkTxt: 'حسنا',
        btnOkFunc: () {
          Navigator.of(context).pop();
        },
        btnCancelTxt: 'إغلاق',
        btnCancelFunc: () => Navigator.of(context).pop(),
        backgroundColor: Colors.white,
        dialogType: DialogType.success);
  } else if (stageSelectOnTapFunc(
          keyWord: Provider.of<HomeworkDataViewModel>(listen: false, context)
              .selectKeyWord,
          context: context) ==
      false) {
    checkDebugMode('from stageSelectIsFalse');
    viewDialog(
        context: context,
        title: 'عملية فاشلة',
        content: 'يرجي إختيار مرحلة معينة',
        btnOkTxt: 'حسنا',
        btnOkFunc: () {
          Navigator.of(context).pop();
        },
        btnCancelTxt: 'إغلاق',
        btnCancelFunc: () => Navigator.of(context).pop(),
        backgroundColor: Colors.white,
        dialogType: DialogType.error);
  } else if (classSelectOnTapFunc(
          keyWord: Provider.of<HomeworkDataViewModel>(listen: false, context)
              .selectKeyWord,
          context: context) ==
      false) {
    checkDebugMode('from classSelectIsFalse');
    viewDialog(
        context: context,
        title: 'عملية فاشلة',
        content: 'يرجي إختيار فصل معين',
        btnOkTxt: 'حسنا',
        btnOkFunc: () {
          Navigator.of(context).pop();
        },
        btnCancelTxt: 'إغلاق',
        btnCancelFunc: () => Navigator.of(context).pop(),
        backgroundColor: Colors.white,
        dialogType: DialogType.error);
  } else {
    checkDebugMode('from subjectSelectIsFalse');
    checkDebugMode(stageSelectOnTapFunc(keyWord: 'keyWord', context: context));
    viewDialog(
        context: context,
        title: 'عملية فاشلة',
        content: 'يرجي إختيار مادة معينة',
        btnOkTxt: 'حسنا',
        btnOkFunc: () {
          Navigator.of(context).pop();
        },
        btnCancelTxt: 'إغلاق',
        btnCancelFunc: () => Navigator.of(context).pop(),
        backgroundColor: Colors.white,
        dialogType: DialogType.error);
  }
}

//////////////////////////////////////////////////////////////////////
bool stageSelectOnTapFunc(
    {required String keyWord, required BuildContext context}) {
  if (keyWord == 'المرحلة' || keyWord == '') {
    Provider.of<HomeworkDataViewModel>(listen: false, context).selectKeyWord =
        keyWord;
    checkDebugMode('bye');
    return false;
  } else {
    Provider.of<HomeworkDataViewModel>(listen: false, context).selectKeyWord =
        keyWord;
    checkDebugMode('h1');
    Provider.of<HomeworkDataViewModel>(context, listen: false).classDropEnabl =
        true;
    Provider.of<HomeworkDataViewModel>(context, listen: false).classDropColor =
        Colors.white;
    return true;
  }
}

//////////////////////////////////////////////////////////////////////
bool classSelectOnTapFunc(
    {required String keyWord, required BuildContext context}) {
  if (keyWord == 'فصل' || keyWord == '') {
    Provider.of<HomeworkDataViewModel>(listen: false, context).selectKeyWord =
        keyWord;
    return false;
  } else {
    Provider.of<HomeworkDataViewModel>(listen: false, context).selectKeyWord =
        keyWord;
    Provider.of<HomeworkDataViewModel>(context, listen: false)
        .subjectDropEnabl = true;
    Provider.of<HomeworkDataViewModel>(context, listen: false).chooseClass =
        true;
    Provider.of<HomeworkDataViewModel>(context, listen: false)
        .subjectDropColor = Colors.white;
    Provider.of<HomeworkDataViewModel>(context, listen: false).classDropColor =
        Colors.grey;
    Provider.of<HomeworkDataViewModel>(context, listen: false).classDropEnabl =
        false;
    Provider.of<HomeworkDataViewModel>(context, listen: false).stageDropEnabl =
        false;
    Provider.of<HomeworkDataViewModel>(context, listen: false).stageDropColor =
        Colors.grey;
    return true;
  }
}

//////////////////////////////////////////////////////////////////////
bool subjectSelectOnTapFunc(
    {required String keyWord, required BuildContext context}) {
  if (keyWord == 'المادة' || keyWord == '') {
    Provider.of<HomeworkDataViewModel>(listen: false, context).selectKeyWord =
        keyWord;
    return false;
  } else {
    checkDebugMode('e');
    Provider.of<HomeworkDataViewModel>(listen: false, context).selectKeyWord =
        keyWord;
    Provider.of<HomeworkDataViewModel>(context, listen: false)
        .subjectDropEnabl = false;
    Provider.of<HomeworkDataViewModel>(context, listen: false)
        .subjectDropColor = Colors.grey;
    Provider.of<HomeworkDataViewModel>(context, listen: false).stageDropEnabl =
        true;
    Provider.of<HomeworkDataViewModel>(context, listen: false).stageDropColor =
        Colors.white;
    return true;
  }
}
