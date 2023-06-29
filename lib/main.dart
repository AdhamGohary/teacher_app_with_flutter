import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/repo/services/api.dart';
import 'package:teacher_app/responsive/responsive.dart';
import 'package:teacher_app/ui/screen/mobile_screen/login_screen/login_screen.dart';
import 'package:teacher_app/ui/screen/mobile_screen/main_screen/main_screen.dart';
import 'package:teacher_app/view_model/student_data_view_model/student_data_view_model.dart';
import 'package:teacher_app/view_model/student_view_model/student_view_model.dart';
import 'package:teacher_app/view_model/teacher_classes_view_model.dart/teacher_classes_view_model.dart';
import 'package:teacher_app/view_model/teacher_table_view_model/teacher_table_view_model.dart';
import 'package:teacher_app/view_model/user_data_view_model/user_data_view_model.dart';

import 'view_model/home_work_view_model/home_work_view_model.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
  Provider.debugCheckInvalidValueType = null;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeWorkViewModel>(
          create: (context) => HomeWorkViewModel(homeWorkRepo: Api()),
        ),
         Provider<StudentViewModel>(
          create: (context) => StudentViewModel( studentRepo: Api()),
        ),
        Provider<StudentDataViewModel>(
          create: (context) => StudentDataViewModel(),
        ),
        Provider<TeacherTableViewModel>(
          create: (context) => TeacherTableViewModel(userRepo: Api()),
        ),
        Provider<UserDataViewModel>(
          create: (context) => UserDataViewModel(userRepo: Api()),
        ),
        Provider<TeacheClassesViewModel>(
          create: (context) => TeacheClassesViewModel(userRepo: Api()),
        ),
      ],
      child: MaterialApp(
        home: const Responsive(),
        debugShowCheckedModeBanner: false,
        routes: {
          'LoginScreen': (context) => const LoginScreen(),
          'MainScreen': (context) => const MainScreen()
        },
      ),
    );
  }
}
