import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/model/chat.dart';
import 'package:teacher_app/view_model/chat_view_model/chat_view_model.dart';

sendMsgBtnFunc(
    {required BuildContext context,
    required var studentId,
    required var teacherId,
    required var msg}) async {
  context
      .read<ChatViewModel>()
      .addNewMsg(Chat(studentId: studentId, teacherId: teacherId, msg: msg));

}
