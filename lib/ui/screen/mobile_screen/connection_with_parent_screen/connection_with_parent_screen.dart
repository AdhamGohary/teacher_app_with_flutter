import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/model/chat.dart';
import 'package:teacher_app/ui/screen/mobile_screen/component/sidabar_and_container/sidebar_and_container.dart';
import 'package:teacher_app/ui/screen/mobile_screen/connection_with_parent_screen/compnent/receive_msg.dart';
import 'package:teacher_app/ui/screen/mobile_screen/connection_with_parent_screen/compnent/send_msg.dart';
import 'package:teacher_app/ui/screen/mobile_screen/connection_with_parent_screen/connection_with_parent_screen_functions/send_msg_btn_func.dart';
import 'package:teacher_app/ui/widgets/custom_circle_avatar/custom_circle_avatar.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/ui/widgets/custom_txt_form_field/custom_txt_form_field.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/screen_size_function.dart';
import 'package:teacher_app/view_model/chat_view_model/chat_view_model.dart';
import 'package:teacher_app/view_model/user_data_view_model/user_data_view_model.dart';

// ignore: must_be_immutable
class ConnectionWithFatherOrMother extends StatefulWidget {
  final String nameOfStud;
  final String imageOfStud;
  final String idOfStudent;
  const ConnectionWithFatherOrMother(
      {Key? key,
      required this.nameOfStud,
      required this.imageOfStud,
      required this.idOfStudent})
      : super(key: key);

  @override
  State<ConnectionWithFatherOrMother> createState() =>
      _ConnectionWithFatherOrMotherState();
}

class _ConnectionWithFatherOrMotherState
    extends State<ConnectionWithFatherOrMother> {
  late bool index;
  late int page;
  final _msgTextEditinController = TextEditingController();
  final _scrollController = ScrollController();
  late bool isLoadMore;
  @override
  void initState() {
    Provider.of<ChatViewModel>(context, listen: false).allMsgsOfChat.clear();
    index = true;
    isLoadMore = false;
    page = 1;
    
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        page++;
        setState(() {
          isLoadMore = true;
        });
        await context.read<ChatViewModel>().getMsgsWithPagination(Chat(
            studentId: widget.idOfStudent,
            teacherId: Provider.of<UserDataViewModel>(context, listen: false)
                .teacherId,
            page: page));
        setState(() {
          isLoadMore = false;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _msgTextEditinController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: deepPurple1,
        bottomSheet: Padding(
          padding: EdgeInsets.all(0.02 * getWidth(context: context)),
          child: CustomTxtFormField(
              hintText: 'أكتب الرسالة هنا',
              textEditingController: _msgTextEditinController,
              obScure: false,
              regExpSource: '',
              caseSensitive: false,
              suffixIconWidget: InkWell(
                  onTap: () {
                    if (_msgTextEditinController.text != '') {
                      sendMsgBtnFunc(
                          context: context,
                          studentId: widget.idOfStudent,
                          teacherId: Provider.of<UserDataViewModel>(context,
                                  listen: false)
                              .teacherId,
                          msg: _msgTextEditinController.text);
                      _msgTextEditinController.clear();
                    }
                  },
                  child: Image.asset('images/arrowsend.png')),
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
                      onTap: () {}, child: CustomTxt(data: widget.nameOfStud)),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 0.01 * getHeight(context: context)),
                    child: InkWell(
                      onTap: () {},
                      child: CustomCircleAvatar(
                        maxRadius: 0.13 * getWidth(context: context),
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(widget.imageOfStud),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.6 * getHeight(context: context),
                child: ListView.builder(
                    physics: const ScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    reverse: true,
                    itemCount: isLoadMore
                        ? context.watch<ChatViewModel>().allMsgsOfChat.length +
                            1
                        : context.watch<ChatViewModel>().allMsgsOfChat.length,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      return index >=
                              context
                                  .watch<ChatViewModel>()
                                  .allMsgsOfChat
                                  .length
                          ? const Center(
                              child:
                                  CircularProgressIndicator(color: deepPurple1),
                            )
                          : context
                                      .watch<ChatViewModel>()
                                      .allMsgsOfChat[index]
                                      .isTeacher ==
                                  false
                              ? ReceiveMsg(
                                  imageOfStud: widget.imageOfStud, index: index)
                              : SendMsg(
                                  index: index,
                                );
                    }),
              )
            ],
          ),
        ));
  }
}
