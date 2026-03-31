class Transactionmodel {
  final int id;
  final String title;
  final int amount;
  final String type;

  Transactionmodel({
    required this.id,
    required this.title,
    required this.amount,
    required this.type
  });

  factory Transactionmodel.fromJson(Map json) {
    return Transactionmodel(
      id: json["id"],
      title: json["title"],
      amount: json["amount"],
      type:  json["type"]
    );
  }
}

