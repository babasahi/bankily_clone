import 'dart:convert';
import 'package:demo_project/models/bankily_user.dart';
import 'package:http/http.dart' as http;

const String backendUrl = 'https://uninspirited-multilobar-glen.ngrok-free.dev';

Future<BankilyUser?> registerUser(BankilyUser user) async {
  try {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    Uri url = Uri.parse(backendUrl + '/auth/register');

    Map<String, dynamic> body = {
      "password": user.password,
      "full_name": user.name,
      "phone": user.phoneNumber,
    };

    var response = await http.post(
      url,
      body: jsonEncode(body),
      headers: headers,
    );
    var data = jsonDecode(response.body);
    print(data);
    return BankilyUser(
      phoneNumber: data['user']['phone'],
      name: data['user']['full_name'],
      password: '',
      token: data['token'],
    );
  } catch (e) {
    print(e.toString());
  }
}
