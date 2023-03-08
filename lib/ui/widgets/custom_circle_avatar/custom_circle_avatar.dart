import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCircleAvatar extends StatelessWidget {
  // final String nameOfAssetImage;
  ImageProvider<Object>? backgroundImage;
  Widget? child;
  double? maxRadius;
  Color?backgroundColor;
  CustomCircleAvatar(
      {Key? key,
      // required this.nameOfAssetImage,
      this.maxRadius,
      this.child,
      this.backgroundImage,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: backgroundColor,
        maxRadius: maxRadius,
        backgroundImage: backgroundImage,
        child: child);
  }
}
