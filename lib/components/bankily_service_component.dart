import 'package:flutter/material.dart';

class BankilyService extends StatelessWidget {
  const BankilyService({
    super.key,
    required this.icon,
    required this.name,
  });

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.1,
      width: MediaQuery.sizeOf(context).height * 0.1,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.blue,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
