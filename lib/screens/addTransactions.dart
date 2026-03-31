import 'package:flutter/material.dart';
import 'package:manajemen_uang/service/api_service.dart';

class AddTransactionScreen extends StatefulWidget {
  final String token;
  const AddTransactionScreen({super.key, required this.token});

  @override
  State<AddTransactionScreen> createState() => _AddState();
}

class _AddState extends State<AddTransactionScreen> {
  final title = TextEditingController();
  final amount = TextEditingController();
  String type = "expense";

  void save() async {
    await ApiService.addTransaction(widget.token, {
      "title": title.text,
      "amount": int.parse(amount.text),
      "type": type
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Transaction")),
      body: Column(
        children: [
          TextField(controller: title),
          TextField(controller: amount),
          DropdownButton(
            value: type,
            items: const [
              DropdownMenuItem(value: "income", child: Text("Income")),
              DropdownMenuItem(value: "expense", child: Text("Expense")),
            ],
            onChanged: (v) => setState(() => type = v!),
          ),
          ElevatedButton(onPressed: save, child: const Text("Save"))
        ],
      ),
    );
  }
}