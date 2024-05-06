import 'package:flutter/material.dart';

import './pages/main_page.dart';

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.pink,
        brightness: Brightness.light,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1.0),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20.0,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      home: const MainPage(),
    );
  }
}
