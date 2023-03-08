import 'package:flutter/material.dart';
import 'package:teacher_app/utils/functions/const_functions/print.dart';

class HomeworkDataViewModel extends  ChangeNotifier {
  List<Map<String, dynamic>> homeworkData = [
    {
      'addressOfHomeWork': 'موضوع تعبير',
      'stageAndClass': 'المرحلة الثالثة فصل ب ',
    },
    {
      'addressOfHomeWork': 'موضوع تعبير',
      'stageAndClass': 'المرحلة الثالثة فصل ب ',
    },
    {
      'addressOfHomeWork': 'موضوع تعبير',
      'stageAndClass': 'المرحلة الثالثة فصل ب ',
    },
    {
      'addressOfHomeWork': 'موضوع تعبير',
      'stageAndClass': 'المرحلة الثالثة فصل ب ',
    },
    {
      'addressOfHomeWork': 'موضوع تعبير',
      'stageAndClass': 'المرحلة الأولى فصل ب ',
    },
    {
      'addressOfHomeWork': 'موضوع تعبير',
      'stageAndClass': 'المرحلة الأولى فصل ج ',
    },
    {
      'addressOfHomeWork': 'موضوع تعبير',
      'stageAndClass': 'المرحلة الثانية فصل ب ',
    },
  ];
  List<Map<String, dynamic>> filterList = [
    {
      'addressOfHomeWork': 'موضوع تعبير',
      'stageAndClass': 'المرحلة الثالثة فصل ب ',
    },
    {
      'addressOfHomeWork': 'موضوع تعبير',
      'stageAndClass': 'المرحلة الثالثة فصل ب ',
    },
    {
      'addressOfHomeWork': 'موضوع تعبير',
      'stageAndClass': 'المرحلة الثالثة فصل ب ',
    },
    {
      'addressOfHomeWork': 'موضوع تعبير',
      'stageAndClass': 'المرحلة الثالثة فصل ب ',
    },
    {
      'addressOfHomeWork': 'موضوع تعبير',
      'stageAndClass': 'المرحلة الأولى فصل ب ',
    },
    {
      'addressOfHomeWork': 'موضوع تعبير',
      'stageAndClass': 'المرحلة الأولى فصل ج ',
    },
    {
      'addressOfHomeWork': 'موضوع تعبير',
      'stageAndClass': 'المرحلة الثانية فصل ب ',
    },
  ];
  List<String> stages = ['المرحلة', 'الأولى', 'الثانية'];
  List<String> classes = ['فصل', 'فصل ب', 'فصل ج'];
  List<String> subject = ['المادة', 'الحساب', 'العربي'];
  bool chooseClass = false;
  bool classDropEnabl = false;
  Color? classDropColor = Colors.grey;
  bool subjectDropEnabl = false;
  Color? subjectDropColor = Colors.grey;
  bool stageDropEnabl = true;
  Color? stageDropColor = Colors.white;
  String interKeyWord = '';
  String selectKeyWord = '';
 
  getHomework({
    required String keyWord,
  }) {
    List<Map<String, dynamic>> result = [];
    interKeyWord += '$keyWord ';
    
    if (chooseClass == true) {
      
      checkDebugMode('chooseClassTrue');
      result = (homeworkData
          .where((element) => element['stageAndClass']
              .toLowerCase()
              .trim()
              .contains(interKeyWord.toLowerCase().trim()))
          .toList());
      filterList = result;
      checkDebugMode(filterList);
      interKeyWord = '';
      chooseClass = false;
      notifyListeners();
    } else {
      filterList = homeworkData;
    }
  }
}
// }
