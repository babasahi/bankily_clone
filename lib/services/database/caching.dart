import 'package:demo_project/models/bankily_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> cacheUser(BankilyUser ourUser) async {
  SharedPreferences prefrences = await SharedPreferences.getInstance();

  try {
    await prefrences.setString('phone_number', ourUser.phoneNumber);
    await prefrences.setString('code', ourUser.code);
  } catch (e) {
    print(e.toString());
  }
}
