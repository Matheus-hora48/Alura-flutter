import 'package:flutter/material.dart';

import 'contact_form.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              title: Text(
                'name',
                style: TextStyle(fontSize: 24.0),
              ),
              subtitle: Text(
                'Number',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(
                  MaterialPageRoute(
                    builder: (context) => ContactForm(),
                  ),
                )
                .then((newContact) => debugPrint(newContact.toString()));
          },
          child: const Icon(Icons.add)),
    );
  }
}
