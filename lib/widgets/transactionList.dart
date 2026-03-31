import 'package:flutter/material.dart';
import 'package:manajemen_uang/models/TransactionModel.dart';

class TransactionList extends StatelessWidget {
  final List<Transactionmodel> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (_, i) {
          final t = transactions[i];
          return ListTile(
            title: Text(t.title),
            subtitle: Text(t.type),
            trailing: Text(t.amount.toString()),
          );
        },
      ),
    );
  }
}