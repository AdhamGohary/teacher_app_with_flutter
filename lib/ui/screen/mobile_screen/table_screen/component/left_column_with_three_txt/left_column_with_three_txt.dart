import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';
import 'package:teacher_app/view_model/table_data_view_model/table_data_view_model.dart';

class LeftColumnWithThreeTxt extends StatelessWidget {
  final int index;
  const LeftColumnWithThreeTxt({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.0005 * getWidth(context: context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTxt(
              data:
                  '${context.watch<TableDataViewModel>().selectDay[index]['stage']}',
              fontColor: Colors.white),
          CustomTxt(
              data:
                  '${context.watch<TableDataViewModel>().selectDay[index]['class']}',
              fontColor: Colors.white),
        ],
      ),
    );
  }
}
