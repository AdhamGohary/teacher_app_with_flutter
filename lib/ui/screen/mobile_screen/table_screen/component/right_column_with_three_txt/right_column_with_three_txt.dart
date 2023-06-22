import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/view_model/teacher_table_view_model/teacher_table_view_model.dart';

class RightColumnWithThreeTxt extends StatelessWidget {
  final int index;
  const RightColumnWithThreeTxt({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomTxt(data: '${index + 1}', fontColor: deepPurple1),
        CustomTxt(
            data: context
                .watch<TeacherTableViewModel>()
                .subjectsOfSelectDay![index]
                .subject!
                .name!,
            fontColor: deepPurple1),
        Row(
          children: [
            CustomTxt(
                data: (context
                        .watch<TeacherTableViewModel>()
                        .subjectsOfSelectDay![index]
                        .startAt)
                    .substring(11, 16),
                fontColor: deepPurple1),
            CustomTxt(data: ' - '),
            CustomTxt(
                data: (context
                        .watch<TeacherTableViewModel>()
                        .subjectsOfSelectDay![index]
                        .endAt)
                    .substring(11, 16),
                fontColor: deepPurple1),
          ],
        ),
      ],
    );
  }
}
