import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/ui/screen/mobile_screen/component/sidabar_and_container/sidebar_and_container.dart';
import 'package:teacher_app/ui/screen/mobile_screen/homework_screen/add_homework/add_homework.dart';
import 'package:teacher_app/ui/screen/mobile_screen/homework_screen/component/row_with_three_container.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/ui/widgets/tween_animation_for_widget/tween_animation_for_widget.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/const_functions/navigate_with_slide_transtion_fun.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';
import '../../../../view_model/homework_data_view_model/homework_data_view_model.dart';

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

    Provider.of<HomeworkDataViewModel>(context, listen: false).classDropEnabl =
        false;
    Provider.of<HomeworkDataViewModel>(context, listen: false).classDropColor =
        Colors.grey;
    Provider.of<HomeworkDataViewModel>(context, listen: false)
        .subjectDropEnabl = false;
    Provider.of<HomeworkDataViewModel>(context, listen: false).stageDropColor =
        Colors.grey;
    Provider.of<HomeworkDataViewModel>(context, listen: false).stageDropEnabl =
        true;
    Provider.of<HomeworkDataViewModel>(context, listen: false).stageDropColor =
        Colors.white;
    Provider.of<HomeworkDataViewModel>(context, listen: false).filterList =
        Provider.of<HomeworkDataViewModel>(context, listen: false).homeworkData;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: deepPurple1,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(bottom: 0.02 * getHeight(context: context)),
              child: FloatingActionButton(
                heroTag: 0,
                onPressed: () => setState(() {}),
                backgroundColor: deepPurple1,
                splashColor: Colors.white,
                child: const Icon(Icons.search),
              ),
            ),
            FloatingActionButton(
              heroTag: 1,
              onPressed: () => navigateWithSlideTranstionFun(
                  context: context,
                  nextScreen: const AddHomework(),
                  xBegin: 0,
                  yBegin: 1),
              backgroundColor: deepPurple1,
              splashColor: Colors.white,
              child: const Icon(Icons.edit),
            ),
          ],
        ),
        body: SidebarAndContainer(
          iconIndex: 2,
          widgetOfScreen: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RowWithThreeContainer(),
              Padding(
                padding:
                    EdgeInsets.only(top: 0.05 * getHeight(context: context)),
                child: TweenAnimationForWidget(
                  tweenBegin: 1.0 * getHeight(context: context),
                  tweenEnd: 0.0 * getHeight(context: context),
                  child: SizedBox(
                    height: 0.6 * getHeight(context: context),
                    child: ListView.builder(
                      itemCount: context
                          .watch<HomeworkDataViewModel>()
                          .filterList
                          .length,
                      itemBuilder: (context, index) {
                        return Column(children: [
                          const Divider(
                            color: Colors.grey,
                          ),
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
                                        '${context.watch<HomeworkDataViewModel>().filterList[index]['addressOfHomeWork']}'),
                              ),
                              CustomTxt(
                                  data:
                                      '${context.watch<HomeworkDataViewModel>().filterList[index]['stageAndClass']}'),
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
                ),
              )
            ],
          ),
        ));
  }
}
