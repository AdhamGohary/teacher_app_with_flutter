import 'package:flutter/material.dart';
import 'package:teacher_app/ui/screen/mobile_screen/component/sidabar_and_container/sidebar_and_container.dart';
import 'package:teacher_app/ui/screen/mobile_screen/groups_screen/compnent/receive_msg.dart';
import 'package:teacher_app/ui/screen/mobile_screen/groups_screen/compnent/send_msg.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/ui/widgets/custom_txt_form_field/custom_txt_form_field.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';

// ignore: must_be_immutable
class ConnectionWithFatherOrMother extends StatefulWidget {
  String nameOfStud;
  String imageOfStud;
  ConnectionWithFatherOrMother(
      {Key? key, required this.nameOfStud, required this.imageOfStud})
      : super(key: key);

  @override
  State<ConnectionWithFatherOrMother> createState() =>
      _ConnectionWithFatherOrMotherState();
}

class _ConnectionWithFatherOrMotherState
    extends State<ConnectionWithFatherOrMother> {
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
        bottomSheet: Padding(
          padding: EdgeInsets.all(0.02 * getWidth(context: context)),
          child: CustomTxtFormField(
              hintText: 'أكتب الرسالة هنا',
              obScure: false,
              regExpSource: '',
              caseSensitive: false,
              suffixIconWidget: InkWell(
                  onTap: () {}, child: Image.asset('images/arrowsend.png')),
              borderWidth: 0.001 * getWidth(context: context)),
        ),
        body: SidebarAndContainer(
          iconIndex: 1,
          widgetOfScreen: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {}, child: Image.asset('images/image 130.png')),
                  InkWell(
                      onTap: () {},
                      child: Image.asset('images/checkmark 2.png')),
                  InkWell(
                      onTap: () {}, child: CustomTxt(data: widget.nameOfStud)),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      maxRadius: 0.15 * getWidth(context: context),
                      backgroundColor: Colors.transparent,
                      child: Image.asset(widget.imageOfStud),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.6 * getHeight(context: context),
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return index % 2 == 0
                          ? const ReceiveMsg()
                          : const SendMsg();
                    }),
              )
            ],
          ),
        ));
  }
}
