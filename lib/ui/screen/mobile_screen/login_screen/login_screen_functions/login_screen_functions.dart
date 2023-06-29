import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/model/user.dart';
import 'package:teacher_app/utils/functions/const_functions/view_dialog.dart';
import 'package:teacher_app/view_model/home_work_view_model/home_work_view_model.dart';
import 'package:teacher_app/view_model/student_data_view_model/student_data_view_model.dart';
import 'package:teacher_app/view_model/student_view_model/student_view_model.dart';
import 'package:teacher_app/view_model/teacher_classes_view_model.dart/teacher_classes_view_model.dart';
import 'package:teacher_app/view_model/teacher_table_view_model/teacher_table_view_model.dart';
import 'package:teacher_app/view_model/user_data_view_model/user_data_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> loginBtnOnTapFunc(
    {required String email,
    required String userPassword,
    required BuildContext context}) async {
await  context
      .read<UserDataViewModel>()
      .addUser(User(email: email, password: userPassword));

  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? statusCode = prefs.getInt('statusCode');
  if (statusCode == 200) {
    // ignore: use_build_context_synchronously
     
    // ignore: use_build_context_synchronously
    Navigator.of(context)
        .pushNamedAndRemoveUntil('MainScreen', (route) => false);
  } else {
    viewDialog(
        context: context,
        dialogType: DialogType.error,
        btnOkTxt: 'حسنا',
        btnOkFunc: () => Navigator.of(context).pop(),
        btnCancelTxt: 'إغلاق',
        btnCancelFunc: () => Navigator.of(context).pop(),
        title: 'تسجيل خاطئ',
        content: 'إسم المستخدم أو كلمة السر غير صحيح',
        backgroundColor: Colors.white);
  }
}
