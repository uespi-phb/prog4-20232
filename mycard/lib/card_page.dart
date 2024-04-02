import 'package:flutter/material.dart';

import './info_card.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          color: Colors.teal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/person.jpg'),
              ),
              const Text(
                'Fulano de Tal',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              Text(
                'DESENVOLVEDOR FLUTTER',
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.grey.shade400,
                  letterSpacing: 2.5,
                ),
              ),
              Divider(
                color: Colors.teal.shade100,
                indent: 50.0,
                endIndent: 50.0,
              ),
              const InfoCard(icon: Icons.phone, text: '+55 86 99999-1234'),
              const InfoCard(icon: Icons.email, text: 'fulano@example.com'),
            ],
          )),
    );
  }
}
