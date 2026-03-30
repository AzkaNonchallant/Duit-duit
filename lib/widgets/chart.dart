import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartWidget extends StatelessWidget {
  final double income;
  final double expense;

  const ChartWidget({
    super.key,
    required this.income,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(value: income, title: "Income"),
            PieChartSectionData(value: expense, title: "Expense"),
          ],
        ),
      ),
    );
  }
}