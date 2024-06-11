import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/contact.dart';

typedef ContactMap = Map<String, dynamic>;

class AgendaProvider with ChangeNotifier {
  final _baseUrl = 'https://agenda-3e1c0-default-rtdb.firebaseio.com';

  final List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  Future<void> load() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/contacts.json'),
    );
    final data = jsonDecode(response.body);
    data.forEach((key, value) {
      final contact = Contact(
        id: key,
        name: value['name'],
        email: value['email'],
        phone: value['phone'],
        imageUrl: value['imageUrl'],
      );
      _contacts.add(contact);
    });
    notifyListeners();
  }

  Future<void> save(Contact contact) {
    if (contact.id.isEmpty) {
      return insert(contact);
    } else {
      return update(contact);
    }
  }

  Future<void> insert(Contact contact) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/contacts.json'),
      body: contact.toJson(),
    );

    final body = jsonDecode(response.body);

    _contacts.add(contact.copyWith(
      id: body['name'],
    ));
    notifyListeners();
  }

  Future<void> update(Contact contact) async {
    await http.put(
      Uri.parse('$_baseUrl/contacts/${contact.id}'),
      body: contact.toJson(),
    );

    final index = _contacts.indexWhere((elem) => elem.id == contact.id);
    if (index >= 0) {
      _contacts[index] = contact;
      notifyListeners();
    }
  }
}
