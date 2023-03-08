import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TableDataViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> daysOfWeek = [
    {
      'day': 'MON',
      'subjectsOfThisDay': [
        {
          'nameOfSubj': 'لغة عربية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الاولى',
          'selectDayTweenBegin': 0.0,
          'selectDayTweenEnd': 180.0,
          'class': ' الفصل ب'
        },
        {
          'nameOfSubj': 'لغة عربية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الثانية',
          'selectDayTweenBegin': 0.0,
          'selectDayTweenEnd': 180.0,
          'class': 'الفصل ب'
        },
        {
          'nameOfSubj': 'لغة عربية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الرابعة',
          'class': 'الفصل ب'
        },
        {
          'nameOfSubj': 'لغة عربية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة السادسة',
          'class': 'الفصل ب'
        },
        {
          'nameOfSubj': 'لغة عربية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الثالثة',
          'class': 'الفصل ب'
        },
      ]
    },
    {
      'day': 'TUS',
      'subjectsOfThisDay': [
        {
          'nameOfSubj': 'لغة إنجليزية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الخامسة',
          'class': 'الفصل ج'
        },
        {
          'nameOfSubj': 'لغة إنجليزية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الثالثة',
          'class': 'الفصل ج'
        },
        {
          'nameOfSubj': 'لغة إنجليزية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الاولى',
          'class': 'الفصل ت'
        },
        {
          'nameOfSubj': 'لغة إنجليزية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الاولى',
          'class': 'الفصل ش'
        },
      ]
    },
    {
      'day': 'WED',
      'subjectsOfThisDay': [
        {
          'nameOfSubj': 'لغة إنجليزية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة السادسة',
          'class': 'الفصل ب'
        },
        {
          'nameOfSubj': 'رياضيات',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الخامسة',
          'class': 'الفصل ب'
        },
        {
          'nameOfSubj': 'رياضيات',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الثالثة',
          'class': 'الفصل ب'
        },
        {
          'nameOfSubj': 'رياضيات',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الاولى',
          'class': 'الفصل ب'
        },
      ]
    },
    {
      'day': 'THR',
      'subjectsOfThisDay': [
        {
          'nameOfSubj': 'علوم',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الثانية',
          'class': 'الفصل ت'
        },
        {
          'nameOfSubj': 'علوم',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الرايعة',
          'class': 'الفصل ت'
        },
        {
          'nameOfSubj': 'علوم',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة السادسة',
          'class': 'الفصل ت'
        },
        {
          'nameOfSubj': 'علوم',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الثانية',
          'class': 'الفصل ت'
        },
      ]
    },
    {
      'day': 'FRI',
      'subjectsOfThisDay': [
        {
          'nameOfSubj': 'لغة إنجليزية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الاولى',
          'class': 'الفصل ب'
        },
        {
          'nameOfSubj': 'لغة إنجليزية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الاولى',
          'class': 'الفصل ب'
        },
        {
          'nameOfSubj': 'لغة إنجليزية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الاولى',
          'class': 'الفصل ب'
        },
        {
          'nameOfSubj': 'لغة إنجليزية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الاولى',
          'class': 'الفصل ب'
        },
      ]
    },
    {
      'day': 'SAT',
      'subjectsOfThisDay': [
        {
          'nameOfSubj': 'لغة إنجليزية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الاولى',
          'class': 'الفصل ب'
        },
        {
          'nameOfSubj': 'لغة إنجليزية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الاولى',
          'class': 'الفصل ب'
        },
        {
          'nameOfSubj': 'لغة إنجليزية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الاولى',
          'class': 'الفصل ب'
        },
        {
          'nameOfSubj': 'لغة إنجليزية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الاولى',
          'class': 'الفصل ب'
        },
      ]
    },
    {
      'day': 'SUN',
      'subjectsOfThisDay': [
        {
          'nameOfSubj': 'لغة إنجليزية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الاولى',
          'class': 'الفصل ب'
        },
        {
          'nameOfSubj': 'لغة إنجليزية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الاولى',
          'class': 'الفصل ب'
        },
        {
          'nameOfSubj': 'لغة إنجليزية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الاولى',
          'class': 'الفصل ب'
        },
        {
          'nameOfSubj': 'لغة إنجليزية',
          'clock': ' 8:15pm : 9:15pm ',
          'stage': 'المرحلة الاولى',
          'class': 'الفصل ب'
        },
      ]
    },
  ];
  List<Map<String, dynamic>> selectDay = [];
  int selectDayIndex = 0;
}
