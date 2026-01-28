import 'package:demo_project/models/bankily_user.dart';
import 'package:http/http.dart' as http;

Future<BankilyUser?> registerUser(BankilyUser user) async {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  Map<String, String> body = {
    'name': user.name,
    'phone': user.phoneNumber,
    'password': user.password,
  };
  try {
    final response = await http.post(
      Uri.parse('http://localhost:3000/register'),
      headers: headers,
      body: body,
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
