import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app/app_asset.dart';
import '../models/contact.dart';

class ContactTile extends StatelessWidget {
  final Contact contact;

  const ContactTile(
    this.contact, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        AppImage.person.path,
        semanticsLabel: contact.name,
      ),
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
