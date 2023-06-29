import 'package:teacher_app/model/user.dart';

abstract class UserRepo {
  Future<void> login(User userNameAndPassword);
  Future<List>? getTeacherTable();
  Future<List>? getTeacherClasses();
}
