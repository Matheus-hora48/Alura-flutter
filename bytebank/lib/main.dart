import 'package:bytebank/screens/lista_transferencia.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Bytebankapp());

class Bytebankapp extends StatelessWidget {
  const Bytebankapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: ListaTransferencias());
  }
}



