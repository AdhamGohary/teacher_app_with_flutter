import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/model/chat.dart';
import 'package:teacher_app/ui/widgets/custom_circle_avatar/custom_circle_avatar.dart';
import 'package:teacher_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/screen_size_function.dart';
import 'package:teacher_app/view_model/chat_view_model/chat_view_model.dart';

class ReceiveMsg extends StatelessWidget {
  final String imageOfStud;
  final int index;
  const ReceiveMsg({Key? key, required this.imageOfStud, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: 0.04 * getHeight(context: context),
              right: 0.02 * getWidth(context: context)),
          child: CustomCircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 0.08 * getWidth(context: context),
            backgroundImage: NetworkImage(imageOfStud),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 0.05 * getWidth(context: context)),
          decoration: BoxDecoration(
              color: deepPurple2,
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0.1 * getWidth(context: context)),
                  topLeft: Radius.circular(0.1 * getWidth(context: context)),
                  bottomRight:
                      Radius.circular(0.1 * getWidth(context: context)),
                  bottomLeft: Radius.zero)),
          child: Center(
            child: Selector<ChatViewModel, List<Chat>>(
                selector: (context, chatViewModel) =>
                    chatViewModel.allMsgsOfChat,
                builder: (context, data, _) {
                  return CustomTxt(data: data[index].msg!);
                }),
          ),
        ),
      ],
    );
  }
}
