import 'package:flutter/cupertino.dart';
import 'package:teacher_app/model/user.dart';
import 'package:teacher_app/repo/user_repo.dart';

class UserDataViewModel extends ChangeNotifier {
  late UserRepo userRepo;
  UserDataViewModel({required this.userRepo});
  Future<void> addUser(User user) async {
    await userRepo.login(user);
    notifyListeners();
  }

  /* Future<void> getAllUsers() async {
    List? list = await userRepo.getAllUsers();
    users.addAll(list.map((e) => User.fromJson(e)).toList());
    notifyListeners();
    checkDebugMode(users);
    // checkDebugMode(getToken());
  }*/
}
