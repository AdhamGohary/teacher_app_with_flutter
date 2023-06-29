import 'package:flutter/material.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';

// ignore: must_be_immutable
class CustomTxt extends StatelessWidget {
  String data;
  Color? fontColor;
  TextDirection? textDirection;
  TextOverflow? overflow;
  CustomTxt(
      {super.key, required this.data, this.fontColor, this.textDirection,this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textDirection: textDirection,
      style: TextStyle(
          color: fontColor,
          fontWeight: FontWeight.bold,
          overflow: overflow,
          fontFamily: 'ElMessiri',
          fontSize: 0.05 * getWidth(context: context)),
    );
  }
}
