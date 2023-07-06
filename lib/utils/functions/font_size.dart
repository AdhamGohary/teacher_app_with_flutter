import 'package:flutter/cupertino.dart';
import 'package:teacher_app/utils/functions/screen_size_function.dart';

double titleTxtSize( BuildContext context){
  return  0.1 * getWidth(context: context);
}
double contentTxtSize(BuildContext context){
  return 0.07*getWidth(context: context);
}