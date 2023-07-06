import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/model/student.dart';
import 'package:teacher_app/ui/screen/mobile_screen/component/sidabar_and_container/sidebar_and_container.dart';
import 'package:teacher_app/ui/screen/mobile_screen/connection_with_parent_screen/connection_with_parent_screen.dart';
import 'package:teacher_app/ui/widgets/custom_circle_avatar/custom_circle_avatar.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/ui/widgets/custom_txt_form_field/custom_txt_form_field.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/navigate_with_slide_transtion_fun.dart';
import 'package:teacher_app/utils/functions/screen_size_function.dart';
import 'package:teacher_app/view_model/student_view_model/student_view_model.dart';

class ShowStudents extends StatefulWidget {
  final String? nameOfClass;
  const ShowStudents({
    Key? key,
    required this.nameOfClass,
  }) : super(key: key);

  @override
  State<ShowStudents> createState() => _ShowStudentsState();
}

class _ShowStudentsState extends State<ShowStudents> {
  late bool index;
  late int iconIndex;
  late List<Student> foundStudents;
  @override
  void initState() {
    index = true;
    iconIndex = 1;
    Provider.of<StudentViewModel>(context, listen: false).foundStudents =
        Provider.of<StudentViewModel>(context, listen: false).classStudents;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: deepPurple1,
        body: SidebarAndContainer(
          iconIndex: iconIndex,
          widgetOfScreen: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 0.03 * getHeight(context: context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTxt(data: '${widget.nameOfClass}'),
                    CustomTxt(data: '     الفصل'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 0.02 * getHeight(context: context),
                  bottom: 0.02 * getHeight(context: context),
                ),
                child: CustomTxtFormField(
                    hintText: 'ابحث بالإسم',
                    obScure: false,
                    regExpSource: '',
                    caseSensitive: false,
                    borderWidth: 0.01 * getWidth(context: context),
                    onChanged: (value) {
                      context
                          .read<StudentViewModel>()
                          .getStudent(keyWord: value);
                      setState(() {});
                    }),
              ),
              SizedBox(
                width: getWidth(context: context),
                height: 0.05 * getHeight(context: context),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: context
                        .watch<StudentViewModel>()
                        .detailsOfStudent
                        .length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: 0.055 * getWidth(context: context)),
                        child: Selector<StudentViewModel, List>(
                          selector: (p0, p1) => p1.detailsOfStudent,
                          builder: (context, data, child) =>
                              CustomTxt(data: data[index]),
                        ),
                      );
                    }),
              ),
              Divider(
                color: deepPurple1,
                thickness: 0.01 * getWidth(context: context),
                indent: 15,
                endIndent: 20,
              ),
              SizedBox(
                height: 0.5 * getHeight(context: context),
                child: ListView.builder(
                    itemCount:
                        context.watch<StudentViewModel>().foundStudents!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: 0.03 * getHeight(context: context)),
                        child: Row(
                          children: [
                            Selector<StudentViewModel, List<Student>?>(
                                selector: (context, studentViewModel) =>
                                    studentViewModel.foundStudents,
                                builder: (context, data, _) {
                                  return Expanded(
                                    child: CustomCircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      maxRadius:
                                          0.05 * getHeight(context: context),
                                      backgroundImage: NetworkImage(
                                        data![index].imgUrl,
                                      ),
                                    ),
                                  );
                                }),
                            Selector<StudentViewModel, List<Student>?>(
                                selector: (context, studentViewModel) =>
                                    studentViewModel.foundStudents,
                                builder: (context, data, _) {
                                  return Expanded(
                                    child: SizedBox(
                                      width: 0.10 * getWidth(context: context),
                                      child: CustomTxt(
                                        data: data![index].name,
                                        //
                                      ),
                                    ),
                                  );
                                }),
                            Selector<StudentViewModel, List<Student>?>(
                              selector: (context, studentViewModel) =>
                                  studentViewModel.foundStudents,
                              builder: (context, data, _) => Text(
                                data![index].phoneNumber,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ElMessiri',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Selector<StudentViewModel, List<Student>?>(
                              selector: (context, studentViewModel) =>
                                  studentViewModel.foundStudents,
                              builder: (context, data, _) => Expanded(
                                child: InkWell(
                                    onTap: () async {
                                      navigateWithSlideTranstionFun(
                                          context: context,
                                          nextScreen:
                                              ConnectionWithFatherOrMother(
                                            nameOfStud: data![index].name,
                                            imageOfStud: data[index].imgUrl,
                                            idOfStudent: data[index].id,
                                          ),
                                          xBegin: 1,
                                          yBegin: 0);
                                    },
                                    child: Image.network(
                                        'https://res.cloudinary.com/dybkjdyto/image/upload/v1687871818/chat_2_2_iic9uw.png')),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
