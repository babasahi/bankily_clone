import 'dart:convert';

import 'package:demo_project/services/caching.dart';
import 'package:demo_project/services/database/register.dart';
import 'package:http/http.dart' as http;

Future<String> sendMoney(double amount, String receiverPhone, note) async {
  try {
    String token = await getToken() ?? '';
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    Map<String, String> body = {
      "recipient_phone": receiverPhone,
      "amount": amount.toString(),
      "note": note,
    };
    print(body);
    print(headers);
    final response = await http.post(
      Uri.parse(backendUrl + '/transactions/send'),
      headers: headers,
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return 'success';
    } else {
      print(response.body);
      return response.body;
    }
  } catch (e) {
    print(e.toString());
    return e.toString();
  }
}
