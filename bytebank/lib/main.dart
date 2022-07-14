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
        home: FormularioTransferencia());
  }
}

class FormularioTransferencia extends StatelessWidget {
  //const FormularioTransferencia({Key? key}) : super(key: key);
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Realizar transferencia'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const TextField(
                controller: TextEditingController(_controladorCampoNumeroConta),
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: 'Número da conta',
                    hintText: '0000'),
                keyboardType: TextInputType.number,
              ),
              const TextField(
                style: TextStyle(fontSize: 24.0),
                controller: _controladorCampoValor,
                decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: 'Valor',
                    hintText: '0.00'),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                  onPressed: () {
                    final int numeroConta =
                        int.tryParse(_controladorCampoNumeroConta);
                    final double valor =
                        double.tryParse(_controladorCampoValor);
                    final transferenciaCriada =
                        Transferencia(valor, numeroConta);
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$transferenciaCriada'),
                      ),
                    );
                  },
                  child: const Text('Confirmar'))
            ],
          ),
        ));
  }
}

class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: Column(
        children: [
          ItemTransferencia(
            transferencia: Transferencia(100.00, 859528),
          ),
          ItemTransferencia(
            transferencia: Transferencia(200, 859528),
          ),
          ItemTransferencia(
            transferencia: Transferencia(300, 859528),
          ),
        ],
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;
  const ItemTransferencia({
    Key? key,
    required this.transferencia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.monetization_on,
          color: Colors.green,
        ),
        title: Text('R\$ ${transferencia.valor.toString()}'),
        subtitle: Text(transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta $numeroConta}';
  }
}
