import 'package:flutter/material.dart';

class MainOption extends StatelessWidget {
  const MainOption({
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 52,
          color: Colors.white,
        ),
        Text(title, style: appStyle),
      ],
    );
  }
}

TextStyle appStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
);
