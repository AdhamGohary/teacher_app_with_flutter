
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_app/repo/services/api/auth_api.dart';
import 'package:teacher_app/repo/services/api/chat_api.dart';
import 'package:teacher_app/repo/services/api/classes_api.dart';
import 'package:teacher_app/repo/services/api/home_work_api.dart';
import 'package:teacher_app/repo/services/api/student_api.dart';
import 'package:teacher_app/repo/services/api/table_api.dart';
import 'package:teacher_app/responsive/responsive.dart';
import 'package:teacher_app/ui/screen/mobile_screen/login_screen/login_screen.dart';
import 'package:teacher_app/ui/screen/mobile_screen/main_screen/main_screen.dart';
import 'package:teacher_app/ui/screen/mobile_screen/splash_screen/splash_screen.dart';
import 'package:teacher_app/view_model/chat_view_model/chat_view_model.dart';
import 'package:teacher_app/view_model/student_view_model/student_view_model.dart';
import 'package:teacher_app/view_model/teacher_classes_view_model.dart/teacher_classes_view_model.dart';
import 'package:teacher_app/view_model/teacher_table_view_model/teacher_table_view_model.dart';
import 'package:teacher_app/view_model/user_data_view_model/user_data_view_model.dart';
import 'socket/socket.dart';
import 'view_model/home_work_view_model/home_work_view_model.dart';

void main()  {
     /*SocketManager manager = SocketManager();

   manager.connect();
  manager.sendMessage(
    'addUserIdToRedis','12345'
  );*/

  runApp(const MyApp());

  Provider.debugCheckInvalidValueType = null;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TeacherTableViewModel>(
          create: (context) => TeacherTableViewModel(tableRepo: TableApi()),
        ),
        Provider<UserDataViewModel>(
          create: (context) => UserDataViewModel(authRepo: AuthApi()),
        ),
        Provider<TeacherClassesViewModel>(
          create: (context) =>
              TeacherClassesViewModel(classesRepo: ClassesApi()),
        ),
        Provider<HomeWorkViewModel>(
          create: (context) => HomeWorkViewModel(homeWorkRepo: HomeWorkApi()),
        ),
        Provider<StudentViewModel>(
          create: (context) => StudentViewModel(studentRepo: StudentApi()),
        ),
        Provider<ChatViewModel>(
          create: (context) => ChatViewModel(chatRepo: ChatApi()),
        ),
      ],
      child: MaterialApp(
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          'LoginScreen': (context) => const LoginScreen(),
          'MainScreen': (context) => const MainScreen(),
          'Responsive': (context) => const Responsive()
        },
      ),
    );
  }
}
/*String getTeacherId(){
 
}*/