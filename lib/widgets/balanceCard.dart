import 'package:flutter/material.dart';


class Balancecard extends StatelessWidget {
  
  final int balance;

  const Balancecard({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Balance: $balance ",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}