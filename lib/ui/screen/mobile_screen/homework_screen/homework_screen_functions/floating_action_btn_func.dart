import 'package:flutter/material.dart';
import 'package:teacher_app/ui/screen/mobile_screen/homework_screen/add_homework_screen/add_homework_screen.dart';
import 'package:teacher_app/utils/functions/navigate_with_slide_transtion_fun.dart';

floatingActionBtnfunc({required BuildContext context}) {
  navigateWithSlideTranstionFun(
      context: context, nextScreen: const AddHomework(), xBegin: 0, yBegin: 1);
}
