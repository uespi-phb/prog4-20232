import 'package:flutter/material.dart';

import '../models/contact.dart';

class AgendaProvider with ChangeNotifier {
  final List<Contact> _contacts = [
    Contact(
      id: '1234',
      name: 'Maria Júlia',
      phone: '8699213366',
      email: 'mjulia@email.com',
    ),
    Contact(
      id: '5743',
      name: 'João Pedro',
      phone: '89988551390',
      email: 'jpedro@email.com',
    ),
  ];

  List<Contact> get contacts => _contacts;
}
