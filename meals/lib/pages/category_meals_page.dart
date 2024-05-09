import 'package:flutter/material.dart';

import '../data/database.dart';
import '../models/category.dart';
import '../widgets/meal_card.dart';

class CategoryMealsPage extends StatelessWidget {
  final Category category;

  const CategoryMealsPage(
    this.category, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final meals = Database.mealsByCategory(category.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: meals.length,
        itemBuilder: (_, index) => MealCard(meals.elementAt(index)),
      ),
    );
  }
}
