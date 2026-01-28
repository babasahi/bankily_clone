import 'package:demo_project/models/bankily_user.dart';

Future<bool> loginUser(BankilyUser user) async {
  Map<String, dynamic> body = {
    "code": user.password,
    "phone_number": user.phoneNumber,
  };
  return true;
}
