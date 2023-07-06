import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/ui/screen/mobile_screen/homework_screen/add_homework_screen/add_home_screen_functions/stage_select_on_tap_func.dart';
import 'package:teacher_app/ui/screen/mobile_screen/homework_screen/add_homework_screen/add_home_screen_functions/subject_select_on_tap_func.dart';
import 'package:teacher_app/ui/widgets/custom_container/custom_container.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/screen_size_function.dart';
import 'package:teacher_app/view_model/teacher_classes_view_model.dart/teacher_classes_view_model.dart';

import '../add_home_screen_functions/class_select_on_tap_func.dart';

// ignore: must_be_immutable
class RowWithThreeContainer extends StatefulWidget {
  void Function()? dropMenuOnTapFunc;
  RowWithThreeContainer({
    this.dropMenuOnTapFunc,
    super.key,
  });

  @override
  State<RowWithThreeContainer> createState() => _RowWithThreeContainerState();
}

class _RowWithThreeContainerState extends State<RowWithThreeContainer> {
  late String? selectStage;
  late String? selectClass;
  late String? selectSubject;

  @override
  void initState() {
    selectStage = "الاولى";
    selectClass = 'أ';
    selectSubject = 'اللغة الانجليزية';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 0.03 * getHeight(context: context)),
          child: CustomTxt(
            data: 'الواجبات',
            fontColor: deepPurple1,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomContainer(
              width: 0.27 * getWidth(context: context),
              boxShadow: const [
                BoxShadow(color: Colors.grey, offset: Offset(0, 3))
              ],
              backgroundColor: const Color.fromRGBO(243, 244, 248, 1),
              child: Center(
                child: DropdownButton(
                  value: selectStage,
                  dropdownColor: const Color.fromRGBO(243, 244, 248, 1),
                  onChanged: (val) {
                    selectStage = val;
                  },
                  items: context
                      .watch<TeacherClassesViewModel>()
                      .gradesName
                      .map((e) => DropdownMenuItem(
                            value: e,
                            onTap: () {
                              stageSelectOnTapFunc(
                                  context: context, stageVlaue: e);
                              setState(() {});
                            },
                            child: CustomTxt(
                              data: e,
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            CustomContainer(
              width: 0.27 * getWidth(context: context),
              boxShadow: const [
                BoxShadow(color: Colors.grey, offset: Offset(0, 3))
              ],
              backgroundColor: const Color.fromRGBO(243, 244, 248, 1),
              child: Center(
                child: DropdownButton(
                  value: selectClass,
                  dropdownColor: const Color.fromRGBO(243, 244, 248, 1),
                  onChanged: (val) {
                    selectClass = val;
                  },
                  items: context
                      .watch<TeacherClassesViewModel>()
                      .classesName
                      .map((e) => DropdownMenuItem(
                            value: e,
                            onTap: () {
                              classSelectOnTapFunc(
                                context: context,
                                classValue: e,
                              );
                              setState(() {});
                            },
                            child: CustomTxt(
                              data: e,
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            CustomContainer(
              width: 0.4 * getWidth(context: context),
              boxShadow: const [
                BoxShadow(color: Colors.grey, offset: Offset(0, 3))
              ],
              backgroundColor: const Color.fromRGBO(243, 244, 248, 1),
              child: DropdownButton(
                value: selectSubject,
                dropdownColor: const Color.fromRGBO(243, 244, 248, 1),
                onChanged: (val) {
                  selectSubject = val;
                },
                items: context
                    .watch<TeacherClassesViewModel>()
                    .subjectsName
                    .map((e) => DropdownMenuItem(
                          value: e,
                          onTap: () {
                            subjectSelectOnTapFunc(
                                context: context, subjectValue: e);
                            setState(() {});
                          },
                          child: CustomTxt(
                            data: e,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
