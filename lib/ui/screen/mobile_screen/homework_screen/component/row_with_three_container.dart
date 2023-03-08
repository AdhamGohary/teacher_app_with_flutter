import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/ui/screen/mobile_screen/homework_screen/homework_screen_functions/homework_screen_functions.dart';
import 'package:teacher_app/ui/widgets/custom_container/custom_container.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';
import 'package:teacher_app/view_model/homework_data_view_model/homework_data_view_model.dart';

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
  late bool stageDropEnable;

  @override
  void initState() {
    selectStage = 'المرحلة';
    selectClass = 'فصل';
    selectSubject = 'المادة';
    stageDropEnable = true;
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomContainer(
              width: 0.27 * getWidth(context: context),
              boxShadow: const [
                BoxShadow(color: Colors.grey, offset: Offset(0, 3))
              ],
              backgroundColor:
                  context.watch<HomeworkDataViewModel>().stageDropEnabl == false
                      ? Colors.grey
                      : const Color.fromRGBO(243, 244, 248, 1),
              child: Center(
                child: DropdownButton(
                  value: selectStage,
                  dropdownColor:
                      context.watch<HomeworkDataViewModel>().stageDropColor,
                  onChanged: (val) {
                    selectStage = val;
                  },
                  items: context
                      .watch<HomeworkDataViewModel>()
                      .stages
                      .map((e) => DropdownMenuItem(
                            // ignore: sort_child_properties_last
                            child: CustomTxt(
                              data: e,
                            ),
                            value: e,
                            enabled: context
                                .watch<HomeworkDataViewModel>()
                                .stageDropEnabl,
                            onTap: () {
                              setState(() {
                                stageSelectOnTapFunc(
                                    context: context, keyWord: e);
                                context
                                    .read<HomeworkDataViewModel>()
                                    .getHomework(
                                      keyWord: e,
                                    );
                              });
                            },
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
              backgroundColor:
                  context.watch<HomeworkDataViewModel>().classDropEnabl == false
                      ? Colors.grey
                      : const Color.fromRGBO(243, 244, 248, 1),
              child: Center(
                child: DropdownButton(
                  value: selectClass,
                  dropdownColor:
                      context.watch<HomeworkDataViewModel>().classDropColor,
                  onChanged: (val) {
                    selectClass = val;
                  },
                  items: context
                      .watch<HomeworkDataViewModel>()
                      .classes
                      .map((e) => DropdownMenuItem(
                            // ignore: sort_child_properties_last
                            child: CustomTxt(
                              data: e,
                            ),
                            value: e,
                            enabled: context
                                .watch<HomeworkDataViewModel>()
                                .classDropEnabl,
                            onTap: () {
                              setState(() {
                                classSelectOnTapFunc(
                                    context: context, keyWord: e);
                                context
                                    .read<HomeworkDataViewModel>()
                                    .getHomework(
                                      keyWord: e,
                                    );
                              });
                            },
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
              backgroundColor:
                  context.watch<HomeworkDataViewModel>().subjectDropEnabl ==
                          false
                      ? Colors.grey
                      : const Color.fromRGBO(243, 244, 248, 1),
              child: Center(
                child: DropdownButton(
                  value: selectSubject,
                  dropdownColor:
                      context.watch<HomeworkDataViewModel>().subjectDropColor,
                  onChanged: (val) {
                    setState(() {
                      selectSubject = val;
                    });
                  },
                  items: context
                      .watch<HomeworkDataViewModel>()
                      .subject
                      .map((e) => DropdownMenuItem(
                            // ignore: sort_child_properties_last
                            child: CustomTxt(
                              data: e,
                            ),
                            value: e,
                            enabled: Provider.of<HomeworkDataViewModel>(context,
                                    listen: false)
                                .subjectDropEnabl,
                            onTap: () {
                              setState(() {
                                subjectSelectOnTapFunc(
                                    context: context, keyWord: e);
                              });
                            },
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
