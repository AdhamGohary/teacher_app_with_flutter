import 'package:teacher_app/model/home_work.dart';

abstract class HomeWorkRepo {
  Future<void> addHomeWork(HomeWork homeWork);
  Future<List>? getAllHomeWorks();
}
