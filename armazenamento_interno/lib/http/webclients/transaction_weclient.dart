import 'dart:convert';

import 'package:armazenamento_interno/http/webcliente.dart';
import 'package:armazenamento_interno/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client
        .get(Uri.http(baseUrl, local))
        .timeout(const Duration(seconds: 5));
    List<Transaction> transactions = _toTransaction(response);
    return transactions;
  }

  List<Transaction> _toTransaction(Response response) {
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Transaction> transactions =
        decodedJson.map((dynamic json) => Transaction.fromJson(json)).toList();
    return transactions;
  }

  Future<Transaction> save(Transaction transaction) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(Uri.http(baseUrl, local),
        headers: {'Content-type': 'application/json', 'password': '1000'},
        body: transactionJson);
    return Transaction.fromJson(jsonDecode(response.body));
  }
}
