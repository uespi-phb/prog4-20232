import 'package:flutter/material.dart';
import 'package:meals/pages/category_meals_page.dart';

import '../models/category.dart';
import './app_routes.dart';
import '../pages/main_page.dart';

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
      initialRoute: AppRoutes.root,
      routes: {
        AppRoutes.root: (context) => const MainPage(),
        AppRoutes.categoryMeals: (context) {
          final category =
              ModalRoute.of(context)?.settings.arguments as Category;
          return CategoryMealsPage(category);
        }
      },
    );
  }
}
