import 'package:flutter/material.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';

class SendMsg extends StatelessWidget {
  const SendMsg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 0.17 * getWidth(context: context),
          right: 0.035 * getWidth(context: context)),
      child: Container(
        height: 0.1 *
            getHeight(
              context: context,
            ),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.08 * getWidth(context: context)),
                topLeft: Radius.circular(0.08 * getWidth(context: context)),
                bottomRight: Radius.circular(0.08 * getWidth(context: context)),
                topRight: Radius.zero)),
        child: const Center(
          child: Text(
              '---------------------------------\n-----------------------------'),
        ),
      ),
    );
  }
}
