import 'package:flutter/material.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Account Screen'),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'account_screen');
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.red,
                  size: 42,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
