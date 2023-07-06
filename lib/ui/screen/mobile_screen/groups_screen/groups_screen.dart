import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/model/teacher_classes.dart';
import 'package:teacher_app/ui/screen/mobile_screen/component/sidabar_and_container/sidebar_and_container.dart';
import 'package:teacher_app/ui/screen/mobile_screen/groups_screen/groups_screen_functions/radio_btn_on_change_func.dart';
import 'package:teacher_app/ui/screen/mobile_screen/groups_screen/groups_screen_functions/show_student_btn_on_tab_func.dart';
import 'package:teacher_app/ui/widgets/custom_elvated_btn/custom_elvated_btn.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/font_size.dart';
import 'package:teacher_app/utils/functions/screen_size_function.dart';
import 'package:teacher_app/view_model/student_view_model/student_view_model.dart';
import 'package:teacher_app/view_model/teacher_classes_view_model.dart/teacher_classes_view_model.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  final iconIndex = 1;
  String? myClass;
  @override
  void initState() {
    Provider.of<TeacherClassesViewModel>(context, listen: false)
        .selectClassInGroupScreen = false;
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
                Center(
                  child: Text(
                    ' المراحل والفصول ',
                    style: TextStyle(
                        fontFamily: 'ElMessiri',
                        color: deepPurple1,
                        fontSize: 0.1 * getWidth(context: context)),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: 0.02 * getHeight(context: context),
                        bottom: 0.02 * getHeight(context: context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(
                              left: 0.1 * getWidth(context: context)),
                          child: CustomTxt(data: 'الفصل'),
                        )),
                        Expanded(child: CustomTxt(data: 'المرحلة')),
                        Expanded(child: CustomTxt(data: 'المادة')),
                        Padding(
                          padding: EdgeInsets.only(
                              right: 0.02 * getWidth(context: context)),
                          child: CustomTxt(data: 'إختر'),
                        ),
                      ],
                    )),
                Divider(
                  color: const Color.fromRGBO(32, 85, 120, 0.7),
                  thickness: 0.01 * getWidth(context: context),
                ),
                SizedBox(
                  height: 0.5 * getHeight(context: context),
                  child: ListView.builder(
                      itemCount: context
                          .watch<TeacherClassesViewModel>()
                          .teacherClasses!
                          .length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 0.08 * getHeight(context: context)),
                                  child: Selector<TeacherClassesViewModel,
                                      List<TeacherClasses>?>(
                                    selector: (p0, p1) => p1.teacherClasses,
                                    builder: (context, data, child) =>
                                        CustomTxt(data: data![index].className),
                                  )),
                            ),
                            Expanded(
                                child: Selector<TeacherClassesViewModel,
                                    List<TeacherClasses>?>(
                              selector: (p0, p1) => p1.teacherClasses,
                              builder: (context, data, child) =>
                                  CustomTxt(data: data![index].gradeName),
                            )),
                            Expanded(
                              child: Selector<TeacherClassesViewModel,
                                  List<TeacherClasses>?>(
                                selector: (p0, p1) => p1.teacherClasses,
                                builder: (context, data, child) =>
                                    CustomTxt(data: data![index].subjectName),
                              ),
                            ),
                            Radio(
                                value: context
                                    .watch<TeacherClassesViewModel>()
                                    .teacherClasses![index]
                                    .className,
                                groupValue: myClass,
                                onChanged: (val) {
                                  myClass = val;
                                  radioBtnOnChangeFunc(
                                    context: context,
                                    index: index,
                                  );
                                  setState(() {});
                                })
                          ],
                        );
                      }),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 0.06 * getHeight(context: context)),
                  child: CustomElvatedBtn(
                    txt: 'عرض الطلاب',
                    textStyle: TextStyle(
                        fontFamily: 'ElMessiri',
                        fontSize: contentTxtSize(context)),
                    btnColor: context
                                .watch<TeacherClassesViewModel>()
                                .selectClassInGroupScreen ==
                            true
                        ? deepPurple1
                        : Colors.grey,
                    onTapColor: Colors.white,
                    function: () {
                      showStudentBtnOnTabFunc(
                          context: context,
                          nameOfClass: myClass,
                          classId: Provider.of<StudentViewModel>(context,
                                  listen: false)
                              .classId);

                      setState(() {});
                    },
                  ),
                )
              ],
            )));
  }
}
