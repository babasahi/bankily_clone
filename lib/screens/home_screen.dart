import 'package:demo_project/components/app_title_component.dart';
import 'package:demo_project/components/main_option_component.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> bankilyServices = [
  {
    'name': "Credit",
    'icon': Icons.mobile_friendly,
  },
  {
    'name': "Pay Bills",
    'icon': Icons.wallet,
  },
  {
    'name': "Credit",
    'icon': Icons.mobile_friendly,
  },
  {
    'name': "Pay Bills",
    'icon': Icons.wallet,
  },
  {
    'name': "Credit",
    'icon': Icons.mobile_friendly,
  },
  {
    'name': "Pay Bills",
    'icon': Icons.wallet,
  },
  {
    'name': "Credit",
    'icon': Icons.mobile_friendly,
  },
  {
    'name': "Pay Bills",
    'icon': Icons.wallet,
  },
  {
    'name': "Credit",
    'icon': Icons.mobile_friendly,
  },
  {
    'name': "Pay Bills",
    'icon': Icons.wallet,
  },
  {
    'name': "Credit",
    'icon': Icons.mobile_friendly,
  },
  {
    'name': "Pay Bills",
    'icon': Icons.wallet,
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
                    MainOption(title: 'حسابي', icon: Icons.receipt),
                    MainOption(title: 'تحويل الأموال', icon: Icons.paypal),
                    MainOption(title: 'دفع المشتريات', icon: Icons.payment),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.6,
            child: GridView(
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              children: bankilyServices
                  .map((element) => BankilyService())
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class BankilyService extends StatelessWidget {
  const BankilyService({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: MediaQuery.sizeOf(context).height * 0.1,
      width: MediaQuery.sizeOf(context).height * 0.1,
      margin: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.abc),
          Text('Widget'),
        ],
      ),
    );
  }
}
