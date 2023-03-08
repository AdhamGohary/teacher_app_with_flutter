import 'package:flutter/material.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';

// ignore: must_be_immutable
class CustomIconBtn extends StatelessWidget {
  void Function() function;
  IconData icon;
  double numOfPadding;
  CustomIconBtn(
      {super.key,
      required this.function,
      required this.icon,
      required this.numOfPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: numOfPadding * getHeight(context: context)),
      child: IconButton(
          onPressed: function,
          icon: Icon(
            icon,
          )),
    );
  }
}
