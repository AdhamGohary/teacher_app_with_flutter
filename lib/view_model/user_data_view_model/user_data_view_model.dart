import 'package:flutter/cupertino.dart';

class UserDataViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> userEmailAndPassword = [
    {'email': 'shady@yahoo.com', 'password': '1'},
    {'email': 'hoda@yahoo.com', 'password': 'adham'},
    {'email': 'soso@yahoo.com', 'password': 'adham'}
  ];
}
