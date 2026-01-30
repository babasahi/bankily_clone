import 'dart:convert';

import 'package:demo_project/services/caching.dart';
import 'package:demo_project/services/database/register.dart';
import 'package:http/http.dart' as http;

Future<double?> getAccountBalance() async {
  try {
    String token = await getToken() ?? '';

    Uri url = Uri.parse(backendUrl + '/account/balance');

    Map<String, String> headers = {
      'Content-Type': 'appliaction/json',
      'Authorization': 'Bearer ' + token,
    };

    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body)['balance'];
    } else {
      print(response.statusCode);
      print(response.body);
      return null;
    }
  } catch (e) {
    return null;
  }
}
