import 'package:flutter/material.dart';

class TransactionComponent extends StatelessWidget {
  const TransactionComponent({
    super.key,
    required this.amount,
    required this.phoneNumber,
  });

  final String phoneNumber;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 8,
        left: 8,
        right: 8,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                amount.toStringAsFixed(0) + ' MRU',

                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'إرسال الأموال',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.list),
                  SizedBox(
                    width: 6,
                  ),
                  Image.asset(
                    'assets/icons/aar_ic_restart.png',
                    height: 18,
                    width: 18,
                    color: Colors.green,
                  ),
                ],
              ),

              Row(
                children: [
                  Text(
                    phoneNumber,
                  ),

                  SizedBox(
                    width: 6,
                  ),
                  Text('رقم التليفون'),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
