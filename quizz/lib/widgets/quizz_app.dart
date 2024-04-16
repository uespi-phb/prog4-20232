import 'package:flutter/material.dart';

import '../models/database.dart';
import '../pages/main_page.dart';

class QuizzApp extends StatelessWidget {
  QuizzApp({super.key}) {
    Database.shuffleData();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
