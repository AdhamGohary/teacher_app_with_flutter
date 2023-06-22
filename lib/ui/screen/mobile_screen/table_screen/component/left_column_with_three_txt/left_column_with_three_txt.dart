import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';
import 'package:teacher_app/view_model/teacher_table_view_model/teacher_table_view_model.dart';
import 'package:teacher_app/model/user.dart';

class LeftColumnWithThreeTxt extends StatelessWidget {
  final int index;

  const LeftColumnWithThreeTxt({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.0005 * getWidth(context: context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTxt(
              data: context
                  .watch<TeacherTableViewModel>()
                  .subjectsOfSelectDay![index]
                  .gradeName,
              fontColor: Colors.white),
          CustomTxt(
              data: context
                  .watch<TeacherTableViewModel>()
                  .subjectsOfSelectDay![index]
                  .className!
                  .name!,
              fontColor: Colors.white),
        ],
      ),
    );
  }
}
