import 'package:flutter/material.dart';
import './card_page.dart';

class MyCardApp extends StatelessWidget {
  const MyCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Card',
      home: CardPage(),
    );
  }
}
