import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/ui/screen/mobile_screen/component/sidabar_and_container/sidebar_and_container.dart';
import 'package:teacher_app/ui/screen/mobile_screen/groups_screen/show_students/details_of_students/connection_with_father_or_mother/connection_with_father_or_mother.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/ui/widgets/custom_txt_form_field/custom_txt_form_field.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/const_functions/navigate_with_slide_transtion_fun.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';
import 'package:teacher_app/view_model/class_stage_subject_data_view_model/class_stage_subject_data_view_model.dart';

// ignore: must_be_immutable
class ShowStudents extends StatefulWidget {
  String? nameOfClass;
  ShowStudents({
    Key? key,
    required this.nameOfClass,
  }) : super(key: key);

  @override
  State<ShowStudents> createState() => _ShowStudentsState();
}

class _ShowStudentsState extends State<ShowStudents> {
  late bool index;
  late int iconIndex;

  List<Map<String, dynamic>> foundStudents = [];
  @override
  void initState() {
    index = true;
    iconIndex = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: deepPurple1,
        body: SidebarAndContainer(
          iconIndex: iconIndex,
          widgetOfScreen: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 0.03 * getHeight(context: context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTxt(data: '${widget.nameOfClass}'),
                    CustomTxt(data: '     الفصل'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 0.02 * getHeight(context: context),
                  bottom: 0.02 * getHeight(context: context),
                ),
                child: CustomTxtFormField(
                    hintText: 'ابحث بالإسم',
                    obScure: false,
                    regExpSource: '',
                    caseSensitive: false,
                    borderWidth: 0.01 * getWidth(context: context),
                    onChanged: (value) => setState(() {
                          context
                              .read<ClassStageSubjectDataViewModel>()
                              .getStudent(keyWord: value);
                        })),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTxt(data: 'الصورة'),
                  CustomTxt(data: 'الاسم'),
                  CustomTxt(data: 'رقم ولى الأمر'),
                  CustomTxt(data: 'محادثة'),
                ],
              ),
              Divider(
                color: deepPurple1,
                thickness: 0.01 * getWidth(context: context),
                indent: 15,
                endIndent: 20,
              ),
              SizedBox(
                height: 0.5 * getHeight(context: context),
                child: ListView.builder(
                    itemCount: context
                        .watch<ClassStageSubjectDataViewModel>()
                        .selectClass
                        .length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: 0.02 * getHeight(context: context),
                            bottom: 0.02 * getHeight(context: context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                                '${context.watch<ClassStageSubjectDataViewModel>().selectClass[index]['pic']}'),
                            CustomTxt(
                                data:
                                    '${context.watch<ClassStageSubjectDataViewModel>().selectClass[index]['name']}'),
                            CustomTxt(
                              data:
                                  '${context.watch<ClassStageSubjectDataViewModel>().selectClass[index]['numberOfParent']}',
                            ),
                            InkWell(
                                onTap: () {
                                  navigateWithSlideTranstionFun(
                                      context: context,
                                      nextScreen: ConnectionWithFatherOrMother(
                                        nameOfStud:
                                            '${Provider.of<ClassStageSubjectDataViewModel>(context, listen: false).selectClass[index]['name']}',
                                        imageOfStud:
                                            '${Provider.of<ClassStageSubjectDataViewModel>(context, listen: false).selectClass[index]['pic']}',
                                      ),
                                      xBegin: 1,
                                      yBegin: 0);
                                },
                                child: Image.asset(
                                    '${Provider.of<ClassStageSubjectDataViewModel>(context, listen: false).selectClass[index]['chat']}')),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
