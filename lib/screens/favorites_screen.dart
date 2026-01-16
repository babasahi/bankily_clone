import 'package:demo_project/components/transaction_component.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(56, 186, 216, 1),
        title: Text(
          'المفضلة',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: transactionsList
              .map(
                (element) => TransactionComponent(
                  amount: double.parse(element['amount'].toString()),
                  phoneNumber: element['phoneNumber'],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> transactionsList = [
  {
    'phoneNumber': "223434334",
    'amount': 8000.5,
  },
  {
    'phoneNumber': "223434334",
    'amount': 8000,
  },
  {
    'phoneNumber': "223434334",
    'amount': 8000,
  },
  {
    'phoneNumber': "223434334",
    'amount': 8000,
  },
  {
    'phoneNumber': "223434334",
    'amount': 8000,
  },
  {
    'phoneNumber': "223434334",
    'amount': 8000,
  },
  {
    'phoneNumber': "223434334",
    'amount': 8000,
  },
  {
    'phoneNumber': "223434334",
    'amount': 8000,
  },
  {
    'phoneNumber': "223434334",
    'amount': 8000,
  },
  {
    'phoneNumber': "223434334",
    'amount': 8000,
  },
  {
    'phoneNumber': "223434334",
    'amount': 8000,
  },
];
