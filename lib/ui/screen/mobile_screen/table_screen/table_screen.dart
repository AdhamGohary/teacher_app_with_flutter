import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/ui/screen/mobile_screen/component/sidabar_and_container/sidebar_and_container.dart';
import 'package:teacher_app/ui/screen/mobile_screen/table_screen/component/right_column_with_three_txt/right_column_with_three_txt.dart';
import 'package:teacher_app/ui/screen/mobile_screen/table_screen/table_screen_functions/table_screen_functions.dart';
import 'package:teacher_app/ui/widgets/custom_container/custom_container.dart';
import 'package:teacher_app/ui/widgets/custom_elvated_btn/custom_elvated_btn.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/screen_size_function.dart';
import 'package:teacher_app/view_model/teacher_table_view_model/teacher_table_view_model.dart';
import 'component/left_column_with_three_txt/left_column_with_three_txt.dart';

class TablesScreen extends StatefulWidget {
  const TablesScreen({Key? key}) : super(key: key);

  @override
  State<TablesScreen> createState() => _TablesScreenState();
}

class _TablesScreenState extends State<TablesScreen> {
  @override
  void initState() {
    Provider.of<TeacherTableViewModel>(context, listen: false).selectDayIndex =
        0;
    Provider.of<TeacherTableViewModel>(context, listen: false)
        .subjectsOfSelectDay!
        .clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: deepPurple1,
        body: SidebarAndContainer(
            iconIndex: 3,
            widgetOfScreen: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 0.05 * getHeight(context: context),
                      bottom: 0.01 * getHeight(context: context)),
                  child: SizedBox(
                      width: getWidth(context: context),
                      height: 0.05 * getHeight(context: context),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: DaysOfWeek.values.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: 0.04 * getWidth(context: context)),
                              child: CustomContainer(
                                backgroundColor: Colors.white,
                                child: CustomElvatedBtn(
                                  onTapColor: deepPurple1,
                                  btnColor: Colors.transparent,
                                  function: () {
                                    selectDayOnBtnFunc(
                                        context: context, index: index);
                                    setState(() {});
                                  },
                                  txt: DaysOfWeek.values
                                      .elementAt(index)
                                      .name
                                      .toUpperCase(),
                                ),
                              ),
                            );
                          })),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 0.01 * getHeight(context: context),
                      bottom: 0.015 * getHeight(context: context)),
                  child: CustomContainer(
                    padding: EdgeInsets.only(
                        left: 0.15 * getWidth(context: context)),
                    backgroundColor: deepPurple2,
                    width: 0.4 * getWidth(context: context),
                    child: CustomTxt(
                      data: DaysOfWeek.values
                          .elementAt(context
                              .watch<TeacherTableViewModel>()
                              .selectDayIndex)
                          .name
                          .toUpperCase(),
                      fontColor: deepPurple1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.7 * getHeight(context: context),
                  width: 0.9 * getWidth(context: context),
                  child: ListView.builder(
                      itemCount: Provider.of<TeacherTableViewModel>(context,
                              listen: false)
                          .subjectsOfSelectDay!
                          .length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: 0.05 * getHeight(context: context),
                          ),
                          child: CustomContainer(
                            backgroundColor:
                                const Color.fromRGBO(243, 244, 248, 0.7),
                            height: 0.14 * getHeight(context: context),
                            width: 0.05 * getWidth(context: context),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey, offset: Offset(0, 3))
                            ],
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomContainer(
                                    padding: EdgeInsets.only(
                                        left:
                                            0.05 * getWidth(context: context)),
                                    backgroundColor: deepPurple1,
                                    width: 0.35 * getWidth(context: context),
                                    child: LeftColumnWithThreeTxt(
                                      index: index,
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 0.02 * getWidth(context: context),
                                        left: 0.1 * getWidth(context: context)),
                                    child:
                                        RightColumnWithThreeTxt(index: index)),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            )));
  }
}
