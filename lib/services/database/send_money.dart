import 'dart:convert';

import 'package:demo_project/services/caching.dart';
import 'package:demo_project/services/database/register.dart';
import 'package:http/http.dart' as http;

Future<String> sendMoney(
  String receiverPhoneNumber,
  double amount,
  String note,
) async {
  try {
    String token = await getToken() ?? '';

    Uri url = Uri.parse(backendUrl + '/transactions/send');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    };

    Map<String, dynamic> body = {
      "recipient_phone": receiverPhoneNumber,
      "amount": amount,
      "note": note,
    };

    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print(response.body);
      return 'success';
    } else {
      print(response.body);
      print(response.statusCode);
      return 'failed';
    }
  } catch (e) {
    return e.toString();
  }
}
