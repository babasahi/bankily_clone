import 'package:demo_project/models/bankily_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> cacheUser(BankilyUser user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('phone_number', user.phoneNumber);
  await prefs.setString('password', user.password);
  await prefs.setString('name', user.name);
}

Future<BankilyUser?> getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? password = prefs.getString('password');
  String? phoneNumber = prefs.getString('phone_number');
  String? name = prefs.getString('name');

  if (password != null && phoneNumber != null && name != null) {
    print('got cached user');
    return BankilyUser(
      phoneNumber: phoneNumber,
      password: password,
      name: name,
    );
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

// Server
