import 'dart:convert';

import 'package:demo_project/models/bankily_user.dart';
import 'package:demo_project/services/database/login.dart';
import 'package:http/http.dart' as http;

Future<BankilyUser?> registerUser(BankilyUser user) async {
  Map<String, String> body = {
    'full_name': user.name,
    'phone': user.phoneNumber,
    'password': user.password,
  };

  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  try {
    final response = await http.post(
      Uri.parse(backendUrl + '/auth/register'),
      body: jsonEncode(body),
      headers: headers,
    );
    if (response.statusCode == 201) {
      print(response.body);
      return null;
    } else {
      print(response.body);
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
}
