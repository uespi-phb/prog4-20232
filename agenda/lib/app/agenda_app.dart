import 'package:agenda/provider/agenda_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/contact.dart';
import './app_route.dart';
import '../pages/contact_page.dart';
import '../pages/home_page.dart';

class AgendaApp extends StatelessWidget {
  const AgendaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AgendaProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Agenda',
        theme: ThemeData(
          colorSchemeSeed: const Color.fromRGBO(79, 111, 82, 1.0),
        ),
        initialRoute: AppRoute.home.route,
        routes: {
          AppRoute.home.route: (_) => const HomePage(),
          AppRoute.newContact.route: (_) => const ContactPage(contact: null),
          AppRoute.editContact.route: (context) {
            final contact = ModalRoute.of(context)?.settings.arguments;
            return ContactPage(
              contact: contact as Contact?,
            );
          }
        },
      ),
    );
  }
}
