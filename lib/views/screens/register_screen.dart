import 'package:demo_project/models/bankily_user.dart';
import 'package:demo_project/services/caching.dart';
import 'package:demo_project/services/database/register.dart';
import 'package:demo_project/views/screens/main_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset('assets/icons/logo_bankily.png'),
            ),
            // takes full name, phone number and a password
            SizedBox(height: 16.0),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'الاسم الكامل',
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'رقم الهاتف',
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'كلمة المرور',
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () async {
                  BankilyUser user = BankilyUser(
                    phoneNumber: phoneNumberController.text,
                    name: nameController.text,
                    password: passwordController.text,
                  );
                  BankilyUser? newUser = await registerUser(user);
                  if (newUser != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('تم انشاء الحساب بنجاح'),
                      ),
                    );
                    await cacheUser(newUser);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('حدث خطأ في انشاء الحساب'),
                      ),
                    );
                  }
                },
                child: Text(
                  'انشاء حساب',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
