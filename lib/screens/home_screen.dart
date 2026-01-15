import 'package:demo_project/components/app_title_component.dart';
import 'package:demo_project/components/main_option_component.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            color: Color.fromRGBO(0, 188, 213, 1),
            height: MediaQuery.sizeOf(context).height / 4.5,
            padding: EdgeInsets.all(14),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppTitle(),
                    Padding(
                      padding: EdgeInsetsGeometry.only(
                        left: MediaQuery.sizeOf(context).width / 3.4,
                      ),
                      child: Image.asset('assets/icons/home_drawer_icon.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MainOption(title: 'حسابي', icon: Icons.receipt),
                    MainOption(title: 'تحويل الأموال', icon: Icons.paypal),
                    MainOption(title: 'دفع المشتريات', icon: Icons.payment),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
