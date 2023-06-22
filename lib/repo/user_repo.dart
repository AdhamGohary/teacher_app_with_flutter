import 'package:teacher_app/model/user.dart';
abstract class UserRepo {
  Future<List>? getTeacherTable();
  Future<void> login(User userNameAndPassword);
  // Future<void> updateUser();
  // Future<void> deleteUser();
}
