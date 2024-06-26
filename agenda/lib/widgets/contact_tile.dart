import 'package:flutter/material.dart';

import '../app/app_asset.dart';
import '../app/app_route.dart';
import '../models/contact.dart';

class ContactTile extends StatelessWidget {
  final Contact contact;

  const ContactTile(
    this.contact, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final image = contact.imageUrl != null
        ? Image.network(contact.imageUrl!)
        : Image.asset(AppImage.person.path);

    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoute.editContact.route,
          arguments: contact,
        );
      },
      leading: image,
      title: Text(contact.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          )),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(contact.phone),
          Text(contact.email),
        ],
      ),
    );
  }
}
