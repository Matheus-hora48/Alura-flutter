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
              Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: "Numero conta",
                dica: '0000',
              ),
              Editor(
                controlador: _controladorCampoValor,
                rotulo: "Valor",
                dica: '0.00',
              ),
              ElevatedButton(
                  onPressed: () {
                    final int? numeroConta =
                        int.tryParse(_controladorCampoNumeroConta.text);
                    final double? valor =
                        double.tryParse(_controladorCampoValor.text);
                    final transferenciaCriada =
                        Transferencia(valor!, numeroConta!);
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

class Editor extends StatelessWidget {
  final TextEditingController _controlador;
  final String _rotulo;
  final String _dica;

  const Editor(
      {Key? key,
      required TextEditingController controlador,
      required String rotulo,
      required String dica})
      : _controlador = controlador,
        _rotulo = rotulo,
        _dica = dica,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controlador,
      style: const TextStyle(fontSize: 24.0),
      decoration: InputDecoration(
          icon: const Icon(null), labelText: _rotulo, hintText: _dica),
      keyboardType: TextInputType.number,
    );
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
