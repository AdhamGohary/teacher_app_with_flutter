import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/ui/screen/mobile_screen/chats_screen/chats_screen.dart';
import 'package:teacher_app/ui/screen/mobile_screen/groups_screen/groups_screen.dart';
import 'package:teacher_app/ui/screen/mobile_screen/homework_screen/homework_screen.dart';
import 'package:teacher_app/ui/screen/mobile_screen/main_screen/main_screen.dart';
import 'package:teacher_app/ui/screen/mobile_screen/table_screen/table_screen.dart';
import 'package:teacher_app/ui/widgets/custom_container/custom_container.dart';
import 'package:teacher_app/ui/widgets/custom_icon_btn/custom_icon_btn.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/const_functions/navigate_with_slide_transtion_fun.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';
import 'package:teacher_app/utils/functions/const_functions/view_dialog.dart';
import 'package:teacher_app/view_model/home_work_view_model/home_work_view_model.dart';
import 'package:teacher_app/view_model/teacher_classes_view_model.dart/teacher_classes_view_model.dart';
import 'package:teacher_app/view_model/teacher_table_view_model/teacher_table_view_model.dart';

// ignore: must_be_immutable
class ContainerAsSideBar extends StatelessWidget {
  late bool index;
  int? iconIndex;
  ContainerAsSideBar({super.key, required this.index, this.iconIndex});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: deepPurple1,
      height: 1.1 * getHeight(context: context),
      width: index == false
          ? 0.0 * getWidth(context: context)
          : 0.13 * getWidth(context: context),
      child: index == true
          ? Column(
              children: [
                CustomContainer(
                  backgroundColor:
                      iconIndex == 0 ? Colors.white : Colors.transparent,
                  child: CustomIconBtn(
                      function: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const MainScreen();
                        }));
                      },
                      icon: Icons.home,
                      numOfPadding: 0.03),
                ),
                CustomContainer(
                  backgroundColor:
                      iconIndex == 1 ? Colors.white : Colors.transparent,
                  child: CustomIconBtn(
                      function: () {
                        navigateWithSlideTranstionFun(
                            context: context,
                            nextScreen: const GroupsScreen(),
                            xBegin: 0,
                            yBegin: 1);
                      },
                      icon: Icons.people,
                      numOfPadding: 0.06),
                ),
                CustomContainer(
                  backgroundColor:
                      iconIndex == 2 ? Colors.white : Colors.transparent,
                  child: CustomIconBtn(
                      function: () {
                        navigateWithSlideTranstionFun(
                            context: context,
                            nextScreen: const HomeworkScreen(),
                            xBegin: 0,
                            yBegin: 1);
                      },
                      icon: Icons.assignment,
                      numOfPadding: 0.08),
                ),
                CustomContainer(
                  backgroundColor:
                      iconIndex == 3 ? Colors.white : Colors.transparent,
                  child: CustomIconBtn(
                      function: () {
                        navigateWithSlideTranstionFun(
                            context: context,
                            nextScreen: const TablesScreen(),
                            xBegin: 1,
                            yBegin: 0);
                      },
                      icon: Icons.calendar_month,
                      numOfPadding: 0.07),
                ),
                CustomContainer(
                  backgroundColor:
                      iconIndex == 4 ? Colors.white : Colors.transparent,
                  child: CustomIconBtn(
                      function: () {
                        navigateWithSlideTranstionFun(
                            context: context,
                            nextScreen: const ChatsScreen(),
                            xBegin: 1,
                            yBegin: 0);
                      },
                      icon: Icons.chat,
                      numOfPadding: 0.08),
                ),
                CustomContainer(
                  backgroundColor:
                      iconIndex == 5 ? Colors.white : Colors.transparent,
                  child: CustomIconBtn(
                      function: () {
                        viewDialog(
                          context: context,
                          backgroundColor: Colors.white,
                          title: 'تسجيل الخروج',
                          content: 'هل تريد تسجيل الخروج',
                          btnCancelTxt: 'لا',
                          btnCancelFunc: () {
                            Navigator.of(context).pop();
                          },
                          btnOkTxt: 'نعم',
                          btnOkFunc: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                'LoginScreen', (route) => false);
                            Provider.of<TeacheClassesViewModel>(context,
                                    listen: false)
                                .teacherClasses = [];
                            Provider.of<TeacherTableViewModel>(context,
                                    listen: false)
                                .teacherTable = [];
                            Provider.of<HomeWorkViewModel>(context,
                                    listen: false)
                                .allHomeWorks = [];
                          },
                          dialogType: DialogType.question,
                        );
                      },
                      icon: Icons.backspace,
                      numOfPadding: 0.08),
                )
              ],
            )
          : null,
    );
  }
}
