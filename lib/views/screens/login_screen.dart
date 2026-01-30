import 'package:demo_project/models/bankily_user.dart';
import 'package:demo_project/services/caching.dart';
import 'package:demo_project/services/database/login.dart';
import 'package:demo_project/views/screens/main_screen.dart';
import 'package:demo_project/views/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phoneNumber = '';
  String code = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset('assets/icons/logo_bankily.png'),

                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'اسم المستخدم أو رقم الهاتف',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 35,
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {
                                setState(() {
                                  phoneNumber = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        FontAwesomeIcons.user,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('الرقم السري'),
                          SizedBox(
                            height: 35,
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            child: Pinput(
                              onChanged: (value) {
                                setState(() {
                                  code = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        FontAwesomeIcons.lock,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 60,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'نسيت كلمة المرور؟',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.27,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'مستخدم جديد ؟ إنشاء حساب',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                BankilyUser u = BankilyUser(
                  name: '',
                  password: code,
                  phoneNumber: phoneNumber,
                );
                BankilyUser? user = await loginUser(u);
                if (user != null) {
                  await cacheUser(user);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (contex) => MainScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Container(
                        child: Center(
                          child: Text(
                            'Password Incorrect',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
              child: Container(
                color: Colors.amber,
                height: 50,
                child: Center(
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
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
