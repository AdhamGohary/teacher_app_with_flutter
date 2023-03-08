import 'package:flutter/material.dart';

class StudentDataViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> dataOfStudent = [
    {
      'pic': 'images/image 90.png',
      'name': 'عثمان',
      'numberOfParent': '012312311',
      'chat': 'images/chat(2)2.png',
    },
    {
      'pic': 'images/image 90.png',
      'name': 'ساديو',
      'numberOfParent': '012312311',
      'chat': 'images/chat(2)2.png',
    },
  ];
  List<Map<String, dynamic>> foundStudent = [
    {
      'pic': 'images/image 90.png',
      'name': 'عثمان',
      'numberOfParent': '012312311',
      'chat': 'images/chat(2)2.png',
    },
    {
      'pic': 'images/image 90.png',
      'name': 'ساديو',
      'numberOfParent': '012312311',
      'chat': 'images/chat(2)2.png',
    },
  ];
  getStudent({required String keyWord}) {
    List<Map<String, dynamic>> result = [];

    if (keyWord.isEmpty) {
      result = dataOfStudent;
    } else {
      result = dataOfStudent
          .where((element) => element['name']
              .toLowerCase()
              .trim()
              .contains(keyWord.toLowerCase().trim()))
          .toList();
    }

    foundStudent = result;
  }
}
