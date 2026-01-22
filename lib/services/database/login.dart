import 'package:demo_project/models/bankily_user.dart';

Future<bool> loginUser(BankilyUser user) async {
  String userPhoneNumber = "1234";
  String userCode = "0000";

  if (userPhoneNumber == user.phoneNumber && user.code == userCode) {
    return true;
  } else {
    return false;
  }
}
