import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/ui/screen/mobile_screen/component/sidabar_and_container/sidebar_and_container.dart';
import 'package:teacher_app/ui/screen/mobile_screen/groups_screen/groups_screen_functions/groups_screen_functions.dart';
import 'package:teacher_app/ui/widgets/custom_elvated_btn/custom_elvated_btn.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/const_functions/font_size.dart';
import 'package:teacher_app/utils/functions/const_functions/print.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';
import 'package:teacher_app/view_model/student_view_model/student_view_model.dart';
import 'package:teacher_app/view_model/teacher_classes_view_model.dart/teacher_classes_view_model.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  late int iconIndex;
  String? myClass;
  @override
  void initState() {
    Provider.of<TeacheClassesViewModel>(context, listen: false)
        .selectClassInGroupScreen = false;
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
                          .watch<TeacheClassesViewModel>()
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
                                child: CustomTxt(
                                    data: context
                                        .watch<TeacheClassesViewModel>()
                                        .teacherClasses![index]
                                        .className),
                              ),
                            ),
                            Expanded(
                                child: CustomTxt(
                                    data: context
                                        .watch<TeacheClassesViewModel>()
                                        .teacherClasses![index]
                                        .gradeName)),
                            Expanded(
                              child: CustomTxt(
                                  data: context
                                      .watch<TeacheClassesViewModel>()
                                      .teacherClasses![index]
                                      .subjectName),
                            ),
                            Radio(
                                value: context
                                    .watch<TeacheClassesViewModel>()
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
                                .watch<TeacheClassesViewModel>()
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
