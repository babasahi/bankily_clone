import 'dart:convert';

import 'package:demo_project/models/bankily_user.dart';
import 'package:demo_project/services/database/register.dart';
import 'package:http/http.dart' as http;

Future<BankilyUser?> loginUser(BankilyUser user) async {
  try {
    Uri url = Uri.parse(backendUrl + '/auth/login');
    Map<String, dynamic> body = {
      "phone": user.phoneNumber,
      "password": user.password,
    };

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print(response.body);
      return BankilyUser(
        phoneNumber: jsonDecode(response.body)['user']['phone'],
        name: jsonDecode(response.body)['user']['full_name'],
        password: '',
        token: jsonDecode(response.body)['token'],
      );
    } else {
      print(response.statusCode);
      print(response.body);
      return null;
    }
  } catch (e) {
    print(e.toString());
    return null;
  }
}
