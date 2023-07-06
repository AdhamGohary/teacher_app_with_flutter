import 'package:flutter/material.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/screen_size_function.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 4000)).then((val) {
      Navigator.of(context).pushReplacementNamed('Responsive');
    });
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
            height: getHeight(context: context),
            width: getWidth(context: context),
            child: Image.asset(
              'images/splashscreen.png',
              fit: BoxFit.fill,
            )),
        Center(
          child: Column(
            children: [
              SizedBox(
                height: 0.7 * getHeight(context: context),
              ),
              SpinKitWaveSpinner(
                color: deepPurple1,
                trackColor: Colors.white,
                waveColor: Colors.white,
                size: 0.2 * getWidth(context: context),
                duration: const Duration(milliseconds: 2500),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
