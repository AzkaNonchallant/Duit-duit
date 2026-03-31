class Summarymodel {
  final int income;
  final int expense;
  final int balance;

  Summarymodel({
    required this.income,
    required this.expense,
    required this.balance
  });

  factory Summarymodel.fromJson(Map json) {
    return Summarymodel(
      income: json["income"] ?? 0,
      expense: json["expense"] ?? 0,
      balance: json["balance"] ?? 0
    );
  }
}