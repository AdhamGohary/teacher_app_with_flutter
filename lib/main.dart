import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/responsive/responsive.dart';
import 'package:teacher_app/ui/screen/mobile_screen/login_screen/login_screen.dart';
import 'package:teacher_app/ui/screen/mobile_screen/main_screen/main_screen.dart';
import 'package:teacher_app/view_model/class_stage_subject_data_view_model/class_stage_subject_data_view_model.dart';
import 'package:teacher_app/view_model/homework_data_view_model/homework_data_view_model.dart';
import 'package:teacher_app/view_model/student_data_view_model/student_data_view_model.dart';
import 'package:teacher_app/view_model/table_data_view_model/table_data_view_model.dart';
import 'package:teacher_app/view_model/user_data_view_model/user_data_view_model.dart';

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
        Provider<HomeworkDataViewModel>(
          create: (context) => HomeworkDataViewModel(),
        ),
        Provider<StudentDataViewModel>(
          create: (context) => StudentDataViewModel(),
        ),
        Provider<ClassStageSubjectDataViewModel>(
          create: (context) => ClassStageSubjectDataViewModel(),
        ),
         Provider<TableDataViewModel>(
          create: (context) => TableDataViewModel(),
        ),
         Provider<UserDataViewModel>(
          create: (context) => UserDataViewModel(),
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
