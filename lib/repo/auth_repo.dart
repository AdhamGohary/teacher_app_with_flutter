import 'package:teacher_app/model/user.dart';

abstract class AuthRepo {
  Future<void> login(User userNameAndPassword);

}
