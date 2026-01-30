import 'dart:convert';

import 'package:demo_project/models/bankily_user.dart';
import 'package:demo_project/services/database/register.dart';
import 'package:http/http.dart' as http;

Future<BankilyUser?> loginUser(BankilyUser user) async {
  try {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    Map<String, String> body = {
      "phone": user.phoneNumber,
      "password": user.password,
    };
    print(body);
    print(headers);
    final response = await http.post(
      Uri.parse(backendUrl + '/auth/login'),
      headers: headers,
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return BankilyUser(
        phoneNumber: jsonDecode(response.body)['user']['phone'],
        password: user.password,
        name: jsonDecode(response.body)['user']['full_name'],
        token: jsonDecode(response.body)['token'],
      );
    } else {
      print(response.body);
      return null;
    }
  } catch (e) {
    print(e.toString());
    return null;
  }
}
