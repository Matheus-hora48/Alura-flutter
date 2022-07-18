import 'package:sqflite/sqflite.dart';

import '../../models/contact.dart';
import '../app_batabase.dart';

class ContactDao {
  static const String tableSql = 'CREATE TABLE $tableName('
      '$id INTEGER PRIMARY KEY, '
      '$name TEXT, '
      '$accountNumberme INTEGER)';
  static const String tableName = 'contacts';
  static const String id = 'id';
  static const String name = 'name';
  static const String accountNumberme = 'account_number';

  Future<int> save(Contact contact) async {
    final Database db = await createDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = {};
    contactMap[name] = contact.name;
    contactMap[accountNumberme] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(tableName);
    List<Contact> contacts = _toList(result);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[id],
        row[name],
        row[accountNumberme],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
