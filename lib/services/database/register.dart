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
    print(body);

    var response = await http.post(
      url,
      body: jsonEncode(body),
      headers: headers,
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
