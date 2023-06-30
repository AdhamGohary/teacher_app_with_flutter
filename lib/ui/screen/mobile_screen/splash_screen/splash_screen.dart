import 'package:flutter/material.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/const_functions/screen_size_function.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AnimationController? animationController;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 4000)).then((val) {
      Navigator.of(context).pushReplacementNamed('Responsive');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
            height: getHeight(context: context),
            width: getWidth(context: context),
            child: Image.network(
              'https://res.cloudinary.com/dybkjdyto/image/upload/v1688082941/iPhone_14_-_1_od5z5n.png',
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
