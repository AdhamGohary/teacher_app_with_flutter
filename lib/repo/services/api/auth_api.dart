import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher_app/model/user.dart';
import 'package:teacher_app/repo/auth_repo.dart';
import 'package:teacher_app/utils/constants/strings.dart';
import 'package:teacher_app/utils/functions/print.dart';
import 'package:http/http.dart' as http;

class AuthApi implements AuthRepo {
  @override
  Future<void> login(User userNameAndPassword) async {
    final loginUrl = Uri.parse('$teacherUrl/login');
    final headers = {'content-type': 'application/json'};
    final body = jsonEncode(userNameAndPassword);
    final prefs = await SharedPreferences.getInstance();
    try {
      final response = await http.post(loginUrl, headers: headers, body: body);
      prefs.setInt('statusCode', response.statusCode);
      prefs.setString('teacherInfo', response.body);
    } catch (e) {
      checkDebugMode(e);
    }
  }
}
