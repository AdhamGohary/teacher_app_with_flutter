import 'package:flutter/material.dart';
import 'package:teacher_app/ui/screen/mobile_screen/chats_screen/chats_screen.dart';
import 'package:teacher_app/ui/screen/mobile_screen/component/sidabar_and_container/sidebar_and_container.dart';
import 'package:teacher_app/ui/screen/mobile_screen/groups_screen/groups_screen.dart';
import 'package:teacher_app/ui/screen/mobile_screen/homework_screen/homework_screen.dart';
import 'package:teacher_app/ui/screen/mobile_screen/main_screen/component/container_with_row_with_two_child.dart';
import 'package:teacher_app/ui/screen/mobile_screen/table_screen/table_screen.dart';
import 'package:teacher_app/ui/widgets/tween_animation_for_widget/tween_animation_for_widget.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: deepPurple1,
        body: SidebarAndContainer(
          iconIndex: iconIndex,
          widgetOfScreen: TweenAnimationForWidget(
            tweenBegin: 1.0 * getHeight(context: context),
            tweenEnd: 0.0 * getHeight(context: context),
            child: Column(
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
                  screen: const GroupsScreen(),
                  function: null,
                ),
                ContainerWithRowWithTwoChild(
                  nameOfImage2: 'images/assignment 1.png',
                  txt: "الواجبات",
                  backgroundColor: const Color.fromRGBO(91, 108, 136, 1),
                  screen: const HomeworkScreen(),
                  function: null,
                ),
                ContainerWithRowWithTwoChild(
                  nameOfImage2: 'images/schedule 1.png',
                  txt: "جدول الحصص",
                  backgroundColor: const Color.fromRGBO(145, 171, 144, 1),
                  screen: const TablesScreen(),
                  function:null,
                ),
                ContainerWithRowWithTwoChild(
                  nameOfImage2: 'images/chat (2) 1.png',
                  txt: "المحادثات",
                  backgroundColor: const Color.fromRGBO(247, 190, 137, 1),
                  screen: const ChatsScreen(),
                  function: null,
                )
              ],
            ),
          ),
        ));
  }
}
