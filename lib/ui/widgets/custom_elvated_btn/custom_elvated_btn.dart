import 'package:flutter/material.dart';
import 'package:teacher_app/utils/functions/screen_size_function.dart';

// ignore: must_be_immutable
class CustomElvatedBtn extends StatelessWidget {
  final String txt;
  Color? btnColor;
  Color? onTapColor;
  TextStyle? textStyle;
  double? height;
  double? width;
  final void Function()? function;
  CustomElvatedBtn(
      {Key? key,
      required this.txt,
      this.function,
      this.btnColor,
      this.onTapColor,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: onTapColor,
          backgroundColor: btnColor,
          shadowColor: Colors.black,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(0.05 * getWidth(context: context)),
          )),
      onPressed: function,
      child: Text(
        txt,
        style: textStyle,
        
      ),
    );
  }
}
