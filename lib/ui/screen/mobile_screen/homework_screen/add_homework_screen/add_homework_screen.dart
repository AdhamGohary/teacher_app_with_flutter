import 'package:flutter/material.dart';
import 'package:teacher_app/ui/screen/mobile_screen/component/sidabar_and_container/sidebar_and_container.dart';
import 'package:teacher_app/ui/screen/mobile_screen/homework_screen/add_homework_screen/add_home_screen_functions/add_homework_btn_func.dart';
import 'package:teacher_app/ui/screen/mobile_screen/homework_screen/add_homework_screen/component/row_with_three_container.dart';
import 'package:teacher_app/ui/widgets/custom_elvated_btn/custom_elvated_btn.dart';
import 'package:teacher_app/ui/widgets/custom_txt_form_field/custom_txt_form_field.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/screen_size_function.dart';
import 'package:teacher_app/view_model/home_work_view_model/home_work_view_model.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/view_model/user_data_view_model/user_data_view_model.dart';

// ignore: must_be_immutable
class AddHomework extends StatefulWidget {
  const AddHomework({Key? key}) : super(key: key);

  @override
  State<AddHomework> createState() => _AddHomeworkState();
}

class _AddHomeworkState extends State<AddHomework> {
  late TextEditingController homeWorkTitle;
  late TextEditingController homeWorkDesc;
  @override
  void initState() {
    homeWorkTitle = TextEditingController();
    homeWorkDesc = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    homeWorkDesc.dispose();
    homeWorkTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: deepPurple1,
        body: SidebarAndContainer(
          iconIndex: 2,
          widgetOfScreen: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RowWithThreeContainer(),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(243, 244, 248, 1),
                  border: Border(
                      top: BorderSide(
                    width: .02 * getWidth(context: context),
                    color: deepPurple1,
                  )),
                ),
                margin: EdgeInsets.symmetric(
                    vertical: 0.035 * getHeight(context: context)),
                width: 0.9 * getWidth(context: context),
                height: 0.17 * getHeight(context: context),
                child: CustomTxtFormField(
                  textEditingController: homeWorkTitle,
                  hintText: 'عنوان الواجب',
                  obScure: false,
                  regExpSource: "",
                  caseSensitive: false,
                  borderWidth: 0,
                  prefixIconWidget: const Icon(Icons.edit),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(243, 244, 248, 1),
                  border: Border(
                      top: BorderSide(
                    width: .02 * getWidth(context: context),
                    color: deepPurple1,
                  )),
                ),
                width: 0.9 * getWidth(context: context),
                height: 0.17 * getHeight(context: context),
                child: CustomTxtFormField(
                  textEditingController: homeWorkDesc,
                  hintText: 'تفاصيل الواجب',
                  obScure: false,
                  regExpSource: "",
                  caseSensitive: false,
                  borderWidth: 0,
                  prefixIconWidget: const Icon(Icons.edit),
                ),
              ),
              const Divider(
                color: Colors.transparent,
              ),
              CustomElvatedBtn(
                  txt: 'إضافة واجب',
                  textStyle: const TextStyle(fontFamily: 'ElMessiri'),
                  btnColor: Colors.blueAccent,
                  onTapColor: Colors.white,
                  function: () {
                    addHomeworkBtnFunc(
                      context: context,
                      title: homeWorkTitle.text.toLowerCase(),
                      desc: homeWorkDesc.text.toLowerCase(),
                      classId:
                          Provider.of<HomeWorkViewModel>(context, listen: false)
                              .classId,
                      grade:
                          Provider.of<HomeWorkViewModel>(context, listen: false)
                              .gradeId,
                      subject:
                          Provider.of<HomeWorkViewModel>(context, listen: false)
                              .subjectId,
                      teacher:
                          Provider.of<UserDataViewModel>(context, listen: false)
                              .teacherId,
                    );
                    homeWorkDesc.clear();
                    homeWorkTitle.clear();
                  })
            ],
          ),
        ));
  }
}
