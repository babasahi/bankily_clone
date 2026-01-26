import 'package:demo_project/views/components/app_title_component.dart';
import 'package:demo_project/views/components/bankily_service_component.dart';
import 'package:demo_project/views/components/main_option_component.dart';
import 'package:demo_project/views/screens/accounts_screen.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> bankilyServices = [
  {
    'name': " شحن رصيد الهاتف",
    'icon': Icons.phone,
  },
  {
    'name': "دفع الفواتير",
    'icon': Icons.receipt,
  },
  {
    'name': " شحن رصيد الهاتف",
    'icon': Icons.phone,
  },
  {
    'name': "دفع الفواتير",
    'icon': Icons.receipt,
  },
  {
    'name': " شحن رصيد الهاتف",
    'icon': Icons.phone,
  },
  {
    'name': "دفع الفواتير",
    'icon': Icons.receipt,
  },
  {
    'name': "دفع الفواتير",
    'icon': Icons.receipt,
  },
];

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
                  height: MediaQuery.sizeOf(context).height * 0.046,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountsScreen(),
                          ),
                        );
                      },
                      child: MainOption(title: 'حسابي', icon: Icons.receipt),
                    ),
                    MainOption(title: 'تحويل الأموال', icon: Icons.paypal),
                    MainOption(title: 'دفع المشتريات', icon: Icons.payment),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.6,
            child: GridView.count(
              crossAxisSpacing: 2,
              crossAxisCount: 3,
              children: bankilyServices
                  .map(
                    (e) => BankilyService(
                      name: e['name'],
                      icon: e['icon'],
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
