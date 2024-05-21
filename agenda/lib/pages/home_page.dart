import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/app_route.dart';
import '../provider/agenda_provider.dart';
import '../widgets/contact_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final contacts =
        Provider.of<AgendaProvider>(context, listen: false).contacts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoute.newContact.route);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: contacts.map((contact) => ContactTile(contact)).toList(),
      ),
    );
  }
}
