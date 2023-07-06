import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/model/chat.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/utils/functions/screen_size_function.dart';
import 'package:teacher_app/view_model/chat_view_model/chat_view_model.dart';

class SendMsg extends StatelessWidget {
  final int index;
  const SendMsg({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 0.27 * getWidth(context: context),
          right: 0.035 * getWidth(context: context),
          bottom: 0.02 * getHeight(context: context)),
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 0.05 * getWidth(context: context)),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.08 * getWidth(context: context)),
                topLeft: Radius.circular(0.08 * getWidth(context: context)),
                bottomRight: Radius.circular(0.08 * getWidth(context: context)),
                topRight: Radius.zero)),
        child: Center(
          child: Selector<ChatViewModel, List<Chat>>(
              selector: (context, chatViewModel) => chatViewModel.allMsgsOfChat,
              builder: (context, data, _) {
                return CustomTxt(data: data[index].msg!);
              }),
        ),
      ),
    );
  }
}
