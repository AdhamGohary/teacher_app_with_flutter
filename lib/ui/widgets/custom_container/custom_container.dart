import 'package:flutter/material.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  Widget? child;
  Color? color1;
  Color? color2;
  Color? backgroundColor;
  AlignmentGeometry? begin;
  AlignmentGeometry? end;
  double? height;
  double? width;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  List<BoxShadow>? boxShadow;
  BoxBorder? border;
  BorderRadiusGeometry? borderRadius;

  CustomContainer(
      {Key? key,
      this.child,
      this.backgroundColor,
      this.color1,
      this.color2,
      this.begin,
      this.end,
      this.height,
      this.width,
      this.margin,
      this.boxShadow,
      this.border,
      this.borderRadius,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: boxShadow,
          border: border,
          borderRadius:
              BorderRadius.circular(0.08 * getWidth(context: context))),
      margin: margin,
      child: child,
    );
  }
}
