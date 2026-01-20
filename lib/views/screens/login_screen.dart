import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                            child: Pinput(),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
