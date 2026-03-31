import 'package:flutter/material.dart';
import 'package:manajemen_uang/models/SummaryModel.dart';
import 'package:manajemen_uang/models/TransactionModel.dart';
import 'package:manajemen_uang/service/api_service.dart';
import 'package:manajemen_uang/widgets/balanceCard.dart';
import 'package:manajemen_uang/widgets/chart.dart';
import 'package:manajemen_uang/widgets/transactionList.dart';


class DashboardScreen extends StatefulWidget {
  final String token;
  const DashboardScreen({super.key, required this.token});

  @override
  State<DashboardScreen> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {
  List<Transactionmodel> transactions = [];
  Summarymodel? summary;

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    final t = await ApiService.getTransactions(widget.token);
    final s = await ApiService.getSummary(widget.token);

    setState(() {
      transactions = t.map<Transactionmodel>((e) => Transactionmodel.fromJson(e)).toList();
      summary = Summarymodel.fromJson(s);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Column(
        children: [
          Balancecard(balance: summary?.balance ?? 0),

          ChartWidget(
            income: (summary?.income ?? 0).toDouble(),
            expense: (summary?.expense ?? 0).toDouble(),
          ),

          TransactionList(transactions: transactions),
        ],
      ),
    );
  }
}