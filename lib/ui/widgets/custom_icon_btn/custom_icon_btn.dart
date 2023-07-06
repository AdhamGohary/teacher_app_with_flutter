import 'package:flutter/material.dart';
import 'package:teacher_app/utils/functions/screen_size_function.dart';

class CustomIconBtn extends StatelessWidget {
  final void Function() function;
  final IconData icon;
  final double numOfPadding;
  const CustomIconBtn(
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
