import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:teacher_app/ui/widgets/custom_elvated_btn/custom_elvated_btn.dart';

viewDialog(
    {required BuildContext context,
    Color? backgroundColor,
    String? title,
    String? content,
    required DialogType dialogType,
    required String btnOkTxt,
    required String btnCancelTxt,
    void Function()? btnOkFunc,
    void Function()? btnCancelFunc}) {
  return AwesomeDialog(
          context: context,
          title: title,
          desc: content,
          dialogBackgroundColor: backgroundColor,
          dialogType: dialogType,
          btnOk: CustomElvatedBtn(txt: btnOkTxt, function: btnOkFunc),
          btnCancel:
              CustomElvatedBtn(txt: btnCancelTxt, function: btnCancelFunc))
      .show();
}
