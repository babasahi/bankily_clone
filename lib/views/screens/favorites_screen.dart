import 'package:demo_project/models/bankily_transaction.dart';
import 'package:demo_project/views/components/transaction_component.dart';
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
                (transaction) => TransactionComponent(
                  amount: transaction.amount,
                  phoneNumber: transaction.phoneNumber,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

List<BankilyTransaction> transactionsList = [
  BankilyTransaction(amount: 8000.5, phoneNumber: "223434334"),
  BankilyTransaction(amount: 9000.5, phoneNumber: "223434334"),
  BankilyTransaction(amount: 12000.5, phoneNumber: "223434334"),
  BankilyTransaction(amount: 2000.5, phoneNumber: "223434334"),
  BankilyTransaction(amount: 3000.5, phoneNumber: "223434334"),
];
