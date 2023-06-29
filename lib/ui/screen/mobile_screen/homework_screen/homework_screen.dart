import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/ui/screen/mobile_screen/component/sidabar_and_container/sidebar_and_container.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';
import 'package:teacher_app/view_model/home_work_view_model/home_work_view_model.dart';
import 'homework_screen_functions/homework_screen_functions.dart';

class HomeworkScreen extends StatefulWidget {
  const HomeworkScreen({Key? key}) : super(key: key);

  @override
  State<HomeworkScreen> createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  late bool index;
  late int iconIndex;
  late String? selectClass;
  late String? selectSubject;
  late String? selectStage;
  @override
  void initState() {
    index = true;
    iconIndex = 4;
    selectClass = 'فصل';
    selectSubject = 'المادة';
    selectStage = 'المرحلة';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: deepPurple1,
        floatingActionButton: FloatingActionButton(
          heroTag: 1,
          onPressed: () {
            floatingActionBtnfunc(context: context);
          },
          backgroundColor: deepPurple1,
          splashColor: Colors.white,
          child: const Icon(Icons.edit),
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
                            const Divider(
                              color: Colors.grey,
                            ),
                            CustomTxt(
                                data:
                                    'فصل ${context.watch<HomeWorkViewModel>().allHomeWorks![index].className} المرحلة ${context.watch<HomeWorkViewModel>().allHomeWorks![index].gradeName}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.arrow_back)),
                                ),
                                Expanded(
                                  child: CustomTxt(
                                      data:
                                          '${context.watch<HomeWorkViewModel>().allHomeWorks![index].title}'),
                                ),
                                Expanded(
                                  child: CustomTxt(
                                      data:
                                          '${context.watch<HomeWorkViewModel>().allHomeWorks![index].subjectName}'),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Image.asset('images/attach 1.png'),
                                  ),
                                )
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
