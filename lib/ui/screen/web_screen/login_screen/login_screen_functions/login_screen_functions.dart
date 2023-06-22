import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:teacher_app/utils/functions/const_functions/view_dialog.dart';

loginBtnOnTapFunc(
    {required String userName,
    required String userPassword,
    required BuildContext context}) {
  bool userNameIsCorrect = false;
  bool userPasswordIsCorrect = false;
 /* for (int i = 0;
      i <
          Provider.of<UserDataViewModel>(context, listen: false)
              .users
              .length;
      i++) {
    if (Provider.of<UserDataViewModel>(context, listen: false)
            .users[i].userName ==
        userName) {
        userNameIsCorrect = true;
      if (Provider.of<UserDataViewModel>(context, listen: false)
              .users[i].password==
          userPassword) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('MainScreen', (route) => false);
        userPasswordIsCorrect = true;
        userName = '';
        userPassword = '';
        break;
      }
    } 
  }*/
  if(userNameIsCorrect==false) {
      viewDialog(
          context: context,
          dialogType: DialogType.error,
          btnOkTxt: 'حسنا',
          btnOkFunc: () => Navigator.of(context).pop(),
          btnCancelTxt: 'إغلاق',
          btnCancelFunc: () => Navigator.of(context).pop(),
          title: 'تسجيل خاطئ',
          content: 'إسم المستخدم غير صحيح',
          backgroundColor: Colors.white);
    }
  else if (userPasswordIsCorrect == false) {
    viewDialog(
        context: context,
        dialogType: DialogType.error,
        btnOkTxt: 'حسنا',
        btnOkFunc: () => Navigator.of(context).pop(),
        btnCancelTxt: 'إغلاق',
        btnCancelFunc: () => Navigator.of(context).pop(),
        title: 'تسجيل خاطئ',
        content: 'كلمة السر غير صحيح',
        backgroundColor: Colors.white);
  }
  else{
    
  }
}
