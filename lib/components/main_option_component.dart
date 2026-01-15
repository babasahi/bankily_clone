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
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: Colors.yellowAccent,
              width: 1.2,
            ),
          ),
          child: Icon(
            icon,
            size: 38,
            color: Colors.white,
          ),
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
