import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/model/home_work.dart';
import 'package:teacher_app/ui/screen/mobile_screen/component/sidabar_and_container/sidebar_and_container.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/screen_size_function.dart';
import 'package:teacher_app/view_model/home_work_view_model/home_work_view_model.dart';
import 'homework_screen_functions/floating_action_btn_func.dart';

class HomeworkScreen extends StatelessWidget {
  final index = true;
  final iconIndex = 4;
  final selectClass = 'فصل';
  final selectSubject = 'المادة';
  final selectStage = 'المرحلة';
/////////////////////////////////////////
  const HomeworkScreen({Key? key}) : super(key: key);
///////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: deepPurple1,
        floatingActionButton: FloatingActionButton(
          heroTag: 1,
          backgroundColor: deepPurple1,
          splashColor: Colors.white,
          child: const Icon(Icons.edit),
          onPressed: () {
            floatingActionBtnfunc(context: context);
          },
        ),
        body: SidebarAndContainer(
          iconIndex: 2,
          widgetOfScreen: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 0.05 * getHeight(context: context)),
                child: SizedBox(
                  height: 0.6 * getHeight(context: context),
                  child: ListView.builder(
                    itemCount:
                        context.watch<HomeWorkViewModel>().allHomeWorks!.length,
                    itemBuilder: (context, index) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Divider(
                              color: Colors.grey,
                              height: 0.05 * getHeight(context: context),
                            ),
                            Selector<HomeWorkViewModel, List<HomeWork>?>(
                              selector: (context, homeWorkViewModel) =>
                                  homeWorkViewModel.allHomeWorks,
                              builder: (context, data, _) => CustomTxt(
                                  data:
                                      'فصل ${data![index].className} المرحلة ${data[index].gradeName}'),
                            ),
                            Divider(
                              color: deepPurple1,
                              indent: 0.2 * getWidth(context: context),
                              endIndent: 0.2 * getWidth(context: context),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Selector<HomeWorkViewModel, List<HomeWork>?>(
                                    selector: (context, homeWorkViewModel) =>
                                        homeWorkViewModel.allHomeWorks,
                                    builder: (context, data, _) => CustomTxt(
                                        data: '${data![index].title}')),
                                Selector<HomeWorkViewModel, List<HomeWork>?>(
                                    selector: (context, homeWorkViewModel) =>
                                        homeWorkViewModel.allHomeWorks,
                                    builder: (context, data, _) => CustomTxt(
                                        data: '${data![index].subjectName}')),
                              ],
                            )
                          ]);
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
