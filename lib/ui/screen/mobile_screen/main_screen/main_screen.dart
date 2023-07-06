import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/ui/screen/mobile_screen/chats_screen/chats_screen.dart';
import 'package:teacher_app/ui/screen/mobile_screen/component/sidabar_and_container/sidebar_and_container.dart';
import 'package:teacher_app/ui/screen/mobile_screen/groups_screen/groups_screen.dart';
import 'package:teacher_app/ui/screen/mobile_screen/homework_screen/homework_screen.dart';
import 'package:teacher_app/ui/screen/mobile_screen/main_screen/component/container_with_row_with_two_child.dart';
import 'package:teacher_app/ui/screen/mobile_screen/table_screen/table_screen.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/navigate_with_slide_transtion_fun.dart';
import 'package:teacher_app/utils/functions/screen_size_function.dart';
import 'package:teacher_app/view_model/home_work_view_model/home_work_view_model.dart';
import 'package:teacher_app/view_model/student_view_model/student_view_model.dart';
import 'package:teacher_app/view_model/teacher_classes_view_model.dart/teacher_classes_view_model.dart';
import 'package:teacher_app/view_model/teacher_table_view_model/teacher_table_view_model.dart';
import 'package:teacher_app/view_model/user_data_view_model/user_data_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int iconIndex;
  @override
  void initState() {
    iconIndex = 0;
    context.read<UserDataViewModel>().getTeacherId();
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
                  'الصفحة الرئيسية',
                  style: TextStyle(
                      color: deepPurple1,
                      fontFamily: 'ElMessiri',
                      fontSize: 0.09 * getWidth(context: context)),
                ),
              ),
              ContainerWithRowWithTwoChild(
                nameOfImage2: 'images/people 1.png',
                txt: "المراحل والفصول",
                backgroundColor: const Color.fromRGBO(237, 107, 93, 1),
                onTap: () async {
                  await context
                      .read<TeacherClassesViewModel>()
                      .getTeacherClasses();
                  navigateWithSlideTranstionFun(
                      context: context,
                      nextScreen: const GroupsScreen(),
                      xBegin: 1,
                      yBegin: 0);
                },
              ),
              ContainerWithRowWithTwoChild(
                nameOfImage2: 'images/assignment 1.png',
                txt: "الواجبات",
                backgroundColor: const Color.fromRGBO(91, 108, 136, 1),
                onTap: () async {
                  await context.read<HomeWorkViewModel>().getAllHomeWorks();
                  navigateWithSlideTranstionFun(
                      context: context,
                      nextScreen: const HomeworkScreen(),
                      xBegin: 1,
                      yBegin: 0);
                },
              ),
              ContainerWithRowWithTwoChild(
                nameOfImage2: 'images/schedule 1.png',
                txt: "جدول الحصص",
                backgroundColor: const Color.fromRGBO(145, 171, 144, 1),
                onTap: () async {
                  await context.read<TeacherTableViewModel>().getTeacherTable();

                  navigateWithSlideTranstionFun(
                      context: context,
                      nextScreen: const TablesScreen(),
                      xBegin: 1,
                      yBegin: 0);
                },
              ),
              ContainerWithRowWithTwoChild(
                nameOfImage2: 'images/chat (2) 1.png',
                txt: "المحادثات",
                backgroundColor: const Color.fromRGBO(247, 190, 137, 1),
                onTap: () async {
                  await context.read<StudentViewModel>().getStudentsByClassId(
                      classId:
                          Provider.of<StudentViewModel>(context, listen: false)
                              .classId);
                  navigateWithSlideTranstionFun(
                      context: context,
                      nextScreen: const ChatsScreen(),
                      xBegin: 1,
                      yBegin: 0);
                },
              )
            ],
          ),
        ));
  }
}
