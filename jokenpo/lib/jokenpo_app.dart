import 'package:flutter/material.dart';

import 'pages/main_page.dart';

class JokenpoApp extends StatelessWidget {
  const JokenpoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jokenpo',
      home: MainPage(),
    );
  }
}
