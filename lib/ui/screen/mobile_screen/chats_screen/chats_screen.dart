import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/ui/screen/mobile_screen/component/sidabar_and_container/sidebar_and_container.dart';
import 'package:teacher_app/ui/screen/mobile_screen/groups_screen/show_students/details_of_students/connection_with_father_or_mother/connection_with_father_or_mother.dart';
import 'package:teacher_app/ui/widgets/custom_circle_avatar/custom_circle_avatar.dart';
import 'package:teacher_app/ui/widgets/custom_container/custom_container.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/const_functions/navigate_with_slide_transtion_fun.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';
import 'package:teacher_app/view_model/student_data_view_model/student_data_view_model.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  late bool index;
  @override
  void initState() {
    index = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: deepPurple1,
        body: SidebarAndContainer(
          iconIndex: 4,
          widgetOfScreen: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 0.04 * getHeight(context: context),
                    left: 0.7 * getWidth(context: context)),
                child: CustomTxt(data: 'المحادثات'),
              ),
              SizedBox(
                height: 0.8 * getHeight(context: context),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 0.02 * getHeight(context: context)),
                  child: ListView.builder(
                      itemCount: context
                          .watch<StudentDataViewModel>()
                          .dataOfStudent
                          .length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                navigateWithSlideTranstionFun(
                                    context: context,
                                    nextScreen: ConnectionWithFatherOrMother(
                                      nameOfStud:
                                          '${Provider.of<StudentDataViewModel>(context, listen: false).dataOfStudent[index]['name']}',
                                      imageOfStud:
                                          '${Provider.of<StudentDataViewModel>(context, listen: false).dataOfStudent[index]['pic']}',
                                    ),
                                    xBegin: 1,
                                    yBegin: 0);
                              },
                              child: CustomContainer(
                                height: 0.1 * getHeight(context: context),
                                backgroundColor: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomTxt(
                                      data:
                                          '${context.watch<StudentDataViewModel>().dataOfStudent[index]['name']}',
                                    ),
                                    CustomCircleAvatar(
                                      backgroundImage: AssetImage(
                                          '${context.watch<StudentDataViewModel>().dataOfStudent[index]['pic']}'),
                                      backgroundColor: Colors.white,
                                      maxRadius:
                                          0.1 * getWidth(context: context),
                                    ),
                                    Image.asset(
                                        '${context.watch<StudentDataViewModel>().dataOfStudent[index]['chat']}'),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 0.005 * getWidth(context: context),
                            ),
                          ],
                        );
                      }),
                ),
              )
            ],
          ),
        ));
  }
}
