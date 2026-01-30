import 'dart:convert';
import 'package:demo_project/services/caching.dart';
import 'package:demo_project/services/database/register.dart';
import 'package:http/http.dart' as http;

Future<double?> getAccountBalance() async {
  try {
    String token = await getToken() ?? '';
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(
      Uri.parse(backendUrl + '/account/balance'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['balance'];
    } else {
      return null;
    }
  } catch (e) {
    print(e.toString());
    return null;
  }
}
