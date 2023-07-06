import 'package:flutter/material.dart';
import 'package:teacher_app/ui/screen/mobile_screen/login_screen/login_screen_functions/login_btn_on_tap_func.dart';
import 'package:teacher_app/ui/widgets/custom_container/custom_container.dart';
import 'package:teacher_app/ui/widgets/custom_elvated_btn/custom_elvated_btn.dart';
import 'package:teacher_app/ui/widgets/custom_txt_form_field/custom_txt_form_field.dart';
import 'package:teacher_app/utils/constants/colors.dart';
import 'package:teacher_app/utils/functions/screen_size_function.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController userNameController;
  late TextEditingController passUserNameController;
  @override
  void initState() {
    userNameController = TextEditingController();
    passUserNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passUserNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 0.01 * getHeight(context: context),
            ),
            child: Image.asset('images/teacherwithstuds.png'),
          ),
          CustomContainer(
              backgroundColor: deepPurple1,
              height: 0.7 * getHeight(context: context),
              width: getWidth(context: context),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 0.15 * getHeight(context: context)),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.all(0.02 * getHeight(context: context)),
                      child: CustomTxtFormField(
                        hintText: 'البريد الالكتروني',
                        hintStyle: const TextStyle(color: Colors.white),
                        textEditingController: userNameController,
                        obScure: false,
                        regExpSource: '',
                        caseSensitive: false,
                        keyBoardType: TextInputType.name,
                        suffixIconWidget: const Icon(Icons.email),
                        suffixIconColor: Colors.white,
                        borderWidth: 0.005 * getWidth(context: context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.all(0.02 * getHeight(context: context)),
                      child: CustomTxtFormField(
                        maxLines: 1,
                        hintText: 'كلمة السر',
                        hintStyle: const TextStyle(color: Colors.white),
                        textEditingController: passUserNameController,
                        obScure: true,
                        regExpSource: '',
                        caseSensitive: true,
                        keyBoardType: TextInputType.visiblePassword,
                        suffixIconWidget: const Icon(Icons.lock),
                        suffixIconColor: Colors.white,
                        borderWidth: 0.005 * getWidth(context: context),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.2 * getWidth(context: context)),
                      child: CustomElvatedBtn(
                          txt: 'تسجيل الدخول',
                          textStyle: TextStyle(
                              fontFamily: 'ElMessiri',
                              fontSize: 0.07 * getWidth(context: context),
                              color: deepPurple1),
                          btnColor: Colors.white,
                          onTapColor: deepPurple2,
                          function: () {
                            loginBtnOnTapFunc(
                                email: userNameController.text
                                    .toLowerCase()
                                    .trim(),
                                userPassword: passUserNameController.text
                                    .toLowerCase()
                                    .trim(),
                                context: context);
                          }),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
