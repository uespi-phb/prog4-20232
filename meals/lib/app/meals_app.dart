import 'package:flutter/material.dart';

import '../models/meal.dart';
import './app_routes.dart';
import '../pages/category_meals_page.dart';
import '../pages/meal_detail_page.dart';
import '../models/category.dart';
import '../pages/main_page.dart';

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  Widget _buildMainPage(BuildContext context) {
    return const MainPage();
  }

  Widget _buildCategoryMeals(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    return CategoryMealsPage(category);
  }

  Widget _buildMealDetailPage(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;
    return MealDetailPage(meal);
  }

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
        AppRoutes.root: _buildMainPage,
        AppRoutes.categoryMeals: _buildCategoryMeals,
        AppRoutes.mealDetail: _buildMealDetailPage,
      },
    );
  }
}
