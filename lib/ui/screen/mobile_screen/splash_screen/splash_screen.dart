import 'package:flutter/material.dart';
import 'package:teacher_app/ui/widgets/custom_circle_avatar/custom_circle_avatar.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context: context),
      width: getWidth(context: context),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [deepPurple1, deepPurple1, deepPurple1, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Center(
        child: CustomCircleAvatar(
            backgroundImage:const AssetImage('images/school.jpg'),
            maxRadius: 0.2 * getWidth(context: context)),
      ),
    );
  }
}
