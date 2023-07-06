import 'dart:convert';

import 'package:teacher_app/model/chat.dart';
import 'package:teacher_app/repo/chat_repo.dart';
import 'package:http/http.dart' as http;
import 'package:teacher_app/utils/constants/strings.dart';
import 'package:teacher_app/utils/functions/print.dart';

class ChatApi implements ChatRepo {
  @override
  Future<void> addNewMsg(Chat msgOfChat) async {
    try {
      await http.post(Uri.parse('$teacherUrl/addNewMsg'),
          headers: {'content-type': 'application/json'},
          body: jsonEncode(msgOfChat));
    } catch (e) {
      checkDebugMode(e);
    }
  }

/////////////////////////////////////////////////////////////
  @override
  Future<List> getMsgsWithPagination(Chat teacherStudentId) async {
    var allMsgsOfChat = [];
    try {
      var response = await http.post(
          Uri.parse('$teacherUrl/getMsgsWithPagination'),
          headers: {'content-type': 'application/json'},
          body: jsonEncode(teacherStudentId));
      allMsgsOfChat = jsonDecode(response.body)['messages'];
      checkDebugMode(allMsgsOfChat);
    } catch (e) {
      checkDebugMode(e);
    }
    return allMsgsOfChat;
  }
}
