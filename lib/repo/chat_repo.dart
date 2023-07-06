import 'package:teacher_app/model/chat.dart';

abstract class ChatRepo {
  Future<void> addNewMsg(Chat msgOfChat);
  Future<List> getMsgsWithPagination(Chat teacherStudentId);
}
