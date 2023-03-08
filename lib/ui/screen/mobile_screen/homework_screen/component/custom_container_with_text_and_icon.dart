import 'package:flutter/material.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';

// ignore: must_be_immutable
class CustomContainerWithTextAndIcon extends StatelessWidget {
   CustomContainerWithTextAndIcon({Key? key,this.function, required this.txt}) : super(key: key);
   void Function()? function;
   final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.08 * getHeight(context: context),
      width: 0.8 * getWidth(context: context),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(0.05 * getWidth(context: context)),
        boxShadow: const <BoxShadow>[
          BoxShadow(color: Colors.grey, offset: Offset(0, 2))
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          IconButton(
              onPressed: function, icon: Image.asset('images/arrownext.png')),
              Text(txt,style: TextStyle(color: txtColor,fontSize: 0.08*getWidth(context: context)),),
        ],
      ),
    );
  }
}
