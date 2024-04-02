import 'package:flutter/material.dart';

import './main_page.dart';

class DicesApp extends StatelessWidget {
  const DicesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dices',
      home: MainPage(),
    );
  }
}
