import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/view_model/table_data_view_model/table_data_view_model.dart';

selectDayOnBtnFunc({required BuildContext context, required int index}) {
  Provider.of<TableDataViewModel>(context, listen: false).selectDay =
      Provider.of<TableDataViewModel>(context, listen: false).daysOfWeek[index]
          ['subjectsOfThisDay'];
  Provider.of<TableDataViewModel>(context, listen: false).selectDayIndex =
      index;
}
