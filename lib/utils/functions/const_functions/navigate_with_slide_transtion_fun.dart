import 'package:flutter/material.dart';

navigateWithSlideTranstionFun(
    {required BuildContext context,
    required Widget nextScreen,
    required double xBegin,
    required double yBegin}) {
  Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, _) => nextScreen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin = Offset(xBegin, yBegin);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offestAnimation = animation.drive(tween);
        return SlideTransition(
          position: offestAnimation,
          child: child,
        );
      }));
}
