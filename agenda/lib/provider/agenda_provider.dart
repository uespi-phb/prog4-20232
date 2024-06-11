import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/contact.dart';

typedef ContactMap = Map<String, dynamic>;

class AgendaProvider with ChangeNotifier {
  final _baseUrl = 'https://agenda-3e1c0-default-rtdb.firebaseio.com';

  final List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  Future<void> load() {
    http
        .get(
      Uri.parse('$_baseUrl/contacts.json'),
    )
        .then((response) {
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
    });

    return Future(() {});
  }

  void save(Contact contact) {
    if (contact.id.isEmpty) {
      insert(contact);
    } else {
      update(contact);
    }
  }

  void insert(Contact contact) {
    final future = http.post(
      Uri.parse('$_baseUrl/contacts.json'),
      body: contact.toJson(),
    );
    future.then(
      (response) {
        debugPrint(response.body);

        final body = jsonDecode(response.body);

        _contacts.add(contact.copyWith(
          id: body['name'],
        ));
        notifyListeners();
      },
    );
  }

  void update(Contact contact) {
    final future = http.put(
      Uri.parse('$_baseUrl/contacts/${contact.id}.json'),
      body: contact.toJson(),
    );

    future.then((response) {
      debugPrint(response.body);

      final index = _contacts.indexWhere((elem) => elem.id == contact.id);
      if (index >= 0) {
        _contacts[index] = contact;
        notifyListeners();
      }
    });
  }
}
