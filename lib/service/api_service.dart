import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "http://localhost:3000";

 static Future login(email, password) async {
  final res = await http.post(
    Uri.parse("$baseUrl/auth/login"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"email": email, "password": password}),
  );

  print("STATUS: ${res.statusCode}");
  print("BODY: ${res.body}");

  return jsonDecode(res.body);
}

  static Future getSummary(token) async {
    final res = await http.get(
      Uri.parse("$baseUrl/transactions/summary"),
      headers: {"authorization": token},
    );
    return jsonDecode(res.body);
  }

  static Future getTransactions(token) async {
    final res = await http.get(
      Uri.parse("$baseUrl/transactions"),
      headers: {"authorization": token},
    );
    return jsonDecode(res.body);
  }

  static Future addTransaction(token, data) async {
    await http.post(
      Uri.parse("$baseUrl/transactions"),
      headers: {
        "authorization": token,
        "Content-Type": "application/json"
      },
      body: jsonEncode(data),
    );
  }
}