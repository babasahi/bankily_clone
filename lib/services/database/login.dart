import 'package:demo_project/models/bankily_user.dart';

Future<bool> loginUser(BankilyUser user) async {
  String userPhoneNumber = "1234";
  String userCode = "0000";

  Map<String, dynamic> body = {
    "code": user.code,
    "phone_number": user.phoneNumber,
  };
  return true;
}
