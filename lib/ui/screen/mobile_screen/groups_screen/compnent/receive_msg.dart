import 'package:flutter/material.dart';
import 'package:teacher_app/ui/widgets/custom_circle_avatar/custom_circle_avatar.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';

class ReceiveMsg extends StatelessWidget {
  const ReceiveMsg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: 0.07 * getHeight(context: context),
              right: 0.02 * getWidth(context: context)),
          child: CustomCircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 0.08 * getWidth(context: context),
            child: Image.asset('images/studentpic.png'),
          ),
        ),
        Container(
          height: 0.1 *
              getHeight(
                context: context,
              ),
          width: 0.8 * getWidth(context: context),
          decoration: BoxDecoration(
              color: deepPurple2,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0.1 * getWidth(context: context)),
                  topLeft: Radius.circular(0.1 * getWidth(context: context)),
                  bottomRight:
                      Radius.circular(0.1 * getWidth(context: context)),
                  bottomLeft: Radius.zero)),
          child: const Center(
            child: Text(
                '---------------------------------\n-----------------------------'),
          ),
        ),
      ],
    );
  }
}
