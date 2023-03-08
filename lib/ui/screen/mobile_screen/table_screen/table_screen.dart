import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/ui/screen/mobile_screen/component/sidabar_and_container/sidebar_and_container.dart';
import 'package:teacher_app/ui/screen/mobile_screen/table_screen/component/right_column_with_three_txt/right_column_with_three_txt.dart';
import 'package:teacher_app/ui/screen/mobile_screen/table_screen/table_screen_functions/table_screen_functions.dart';
import 'package:teacher_app/ui/widgets/custom_container/custom_container.dart';
import 'package:teacher_app/ui/widgets/custom_elvated_btn/custom_elvated_btn.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/ui/widgets/tween_animation_for_widget/tween_animation_for_widget.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';
import 'package:teacher_app/view_model/table_data_view_model/table_data_view_model.dart';
import 'component/left_column_with_three_txt/left_column_with_three_txt.dart';

class TablesScreen extends StatefulWidget {
  const TablesScreen({Key? key}) : super(key: key);

  @override
  State<TablesScreen> createState() => _TablesScreenState();
}

class _TablesScreenState extends State<TablesScreen> {
  late bool index;
  late int selectIndex;
  late int selectDayIndex;
  @override
  void initState() {
    index = true;
    selectIndex = 0;
    selectDayIndex = 0;
    Provider.of<TableDataViewModel>(context, listen: false).selectDay =
        Provider.of<TableDataViewModel>(context, listen: false).daysOfWeek[0]
            ['subjectsOfThisDay'];
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
                          itemCount: context
                              .watch<TableDataViewModel>()
                              .daysOfWeek
                              .length,
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
                                    setState(() {
                                      selectDayOnBtnFunc(
                                          context: context, index: index);
                                    });
                                  },
                                  txt: context
                                      .watch<TableDataViewModel>()
                                      .daysOfWeek[index]['day'],
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
                      data: context.watch<TableDataViewModel>().daysOfWeek[
                          context
                              .watch<TableDataViewModel>()
                              .selectDayIndex]['day'],
                      fontColor: deepPurple1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.7 * getHeight(context: context),
                  width: 0.9 * getWidth(context: context),
                  child: TweenAnimationForWidget(
                    tweenBegin: 1.0 * getHeight(context: context),
                    tweenEnd: 0.0 * getHeight(context: context),
                    child: ListView.builder(
                        itemCount: context
                            .watch<TableDataViewModel>()
                            .selectDay
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
                                          left: 0.05 *
                                              getWidth(context: context)),
                                      backgroundColor: deepPurple1,
                                      width: 0.35 * getWidth(context: context),
                                      child: LeftColumnWithThreeTxt(
                                        index: index,
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top:
                                              0.02 * getWidth(context: context),
                                          left:
                                              0.1 * getWidth(context: context)),
                                      child:
                                          RightColumnWithThreeTxt(index: index))
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            )));
  }
}
