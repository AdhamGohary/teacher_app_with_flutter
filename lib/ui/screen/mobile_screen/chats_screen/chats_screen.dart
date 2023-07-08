import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/model/student.dart';
import 'package:teacher_app/ui/screen/mobile_screen/chats_screen/chats_screen_function/chat_icon_btn.dart';
import 'package:teacher_app/ui/screen/mobile_screen/component/sidabar_and_container/sidebar_and_container.dart';
import 'package:teacher_app/ui/widgets/custom_circle_avatar/custom_circle_avatar.dart';
import 'package:teacher_app/ui/widgets/custom_container/custom_container.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/screen_size_function.dart';
import 'package:teacher_app/view_model/student_view_model/student_view_model.dart';

class ChatsScreen extends StatelessWidget {
  final index = true;
  const ChatsScreen({Key? key}) : super(key: key);

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
                          .watch<StudentViewModel>()
                          .classStudents!
                          .length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                chatIconBtn(index: index, context: context, idOfStudent: Provider.of<StudentViewModel>(context,listen: false).classStudents![index].id);
                              },
                              child: CustomContainer(
                                height: 0.1 * getHeight(context: context),
                                backgroundColor: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 0.05 *
                                                  getWidth(context: context)),
                                          child: Selector<StudentViewModel,
                                              List<Student>?>(
                                            selector: (context,
                                                    studentViewModel) =>
                                                studentViewModel.classStudents,
                                            builder: (context, data, child) =>
                                                CustomTxt(
                                              data: data![index].name,
                                            ),
                                          )),
                                    ),
                                    Expanded(
                                        child: CustomCircleAvatar(
                                            backgroundColor: Colors.white,
                                            maxRadius: 0.08 *
                                                getWidth(context: context),
                                            child: Selector<StudentViewModel,
                                                List<Student>?>(
                                              selector:
                                                  (context, studentViewModel) =>
                                                      studentViewModel
                                                          .classStudents,
                                              builder: (context, data, child) =>
                                                  Image.network(
                                                      data![index].imgUrl),
                                            ))),
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
