import 'package:flutter/material.dart';
import 'package:teacher_app/ui/widgets/custom_container/custom_container.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/utils/functions/const_functions/navigate_with_slide_transtion_fun.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';

// ignore: must_be_immutable
class ContainerWithRowWithTwoChild extends StatelessWidget {
  Color? backgroundColor;
  String nameOfImage2;
  String txt;
  Widget screen;
  Future<Function>? function;

  ContainerWithRowWithTwoChild(
      {super.key,
      this.backgroundColor,
      required this.screen,
      required this.nameOfImage2,
      required this.txt,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 500),
      padding: EdgeInsets.only(
          left: 0.07 * getWidth(context: context),
          right: 0.07 * getWidth(context: context),
          top: 0.03 * getHeight(context: context)),
      child: InkWell(
        onTap: () async {
          await function;
          navigateWithSlideTranstionFun(
              context: context, nextScreen: screen, xBegin: 1, yBegin: 0);
        },
        child: CustomContainer(
          height: 0.12 * getHeight(context: context),
          backgroundColor: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 0.05 * getWidth(context: context)),
                child: CustomTxt(
                  data: txt,
                  fontColor: Colors.white,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: 0.05 * getWidth(context: context)),
                child: Image.asset(nameOfImage2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
