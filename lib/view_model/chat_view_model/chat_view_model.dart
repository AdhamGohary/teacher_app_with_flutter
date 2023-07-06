import 'package:flutter/material.dart';
import 'package:teacher_app/model/chat.dart';
import 'package:teacher_app/repo/chat_repo.dart';

class ChatViewModel extends ChangeNotifier {
  late ChatRepo chatRepo;
  List<Chat> allMsgsOfChat = [];
///////////////////////////////////////
  ChatViewModel({required this.chatRepo});
///////////////////////////////////////
  void addNewMsg(Chat msgOfChat) async {
    await chatRepo.addNewMsg(msgOfChat);
    allMsgsOfChat.insert(0, msgOfChat);
    notifyListeners();
  }

///////////////////////////////////////
  Future<void> getMsgsWithPagination(Chat teacherStudentId) async {
    var list = await chatRepo.getMsgsWithPagination(teacherStudentId);
    allMsgsOfChat.addAll(list.map((e) => Chat.fromJson(e)));
    notifyListeners();
  }
}
