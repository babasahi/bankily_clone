import 'package:demo_project/models/bankily_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> cacheUser(BankilyUser user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('phone_number', user.phoneNumber);
  await prefs.setString('code', user.phoneNumber);
}

Future<BankilyUser?> getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? code = await prefs.getString('code');
  String? phoneNumber = await prefs.getString('phone_number');

  if (code != null && phoneNumber != null) {
    print('got cached user');
    return BankilyUser(phoneNumber: phoneNumber, code: code);
  } else {
    return null;
  }
}

Future<void> deleteCachedUser() async {
  print('deleting cached user');
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.remove('code');
  await prefs.remove('phone_number');
}
