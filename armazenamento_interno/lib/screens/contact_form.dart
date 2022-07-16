import 'package:armazenamento_interno/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New contact')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Full name',
              ),
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: accountNumberController,
                decoration: InputDecoration(
                  labelText: 'Account number',
                ),
                style: TextStyle(fontSize: 24.0),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String? name = nameController.text.toString();
                    final int? accountNumber =
                        int.tryParse(accountNumberController.text.toString());
                    final Contact newContact = Contact(0, name, accountNumber!);
                    Navigator.pop(context, newContact);
                  },
                  child: Text('Create'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
