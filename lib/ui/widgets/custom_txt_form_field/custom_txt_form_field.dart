import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTxtFormField extends StatelessWidget {
  String? hintText;
  TextStyle? hintStyle;
  final bool obScure;
  int? maxLines;
  String? ifBody;
  String regExpSource;
  GlobalKey<FormState>? myKey;
  TextEditingController? textEditingController;
  final bool caseSensitive;
  TextInputType? keyBoardType;
  Widget? suffixIconWidget;
  String? suffixTxt;
  Color? suffixIconColor;
  Widget? prefixIconWidget;
  Color? prefixIconColor;
  void Function()? function;
  void Function(String)? onChanged;
  final double borderWidth;
  CustomTxtFormField({
    Key? key,
    required this.hintText,
    required this.obScure,
    required this.regExpSource,
    required this.caseSensitive,
    required this.borderWidth,
    this.onChanged,
    this.hintStyle,
    this.myKey,
    this.maxLines,
    this.ifBody,
    this.textEditingController,
    this.keyBoardType,
    this.suffixTxt,
    this.suffixIconWidget,
    this.suffixIconColor,
    this.prefixIconWidget,
    this.prefixIconColor,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: TextFormField(
      keyboardType: keyBoardType,
      controller: textEditingController,
      obscureText: obScure,
      maxLines: maxLines,
      textDirection: TextDirection.rtl,
      onTap: function,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixText: suffixTxt,
        suffixIcon: suffixIconWidget,
        suffixIconColor: suffixIconColor,
        prefixIcon: prefixIconWidget,
        prefixIconColor: prefixIconColor,
        filled: true,
        fillColor: Colors.transparent,
        hintText: hintText,
        hintTextDirection: TextDirection.rtl,
        hintStyle: hintStyle,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: borderWidth),
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.blue, width: borderWidth),
        // ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: borderWidth),
        ),
      ),
    ));
  }
}
