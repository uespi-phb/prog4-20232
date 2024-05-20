import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/category.dart';
import '../providers/meals_provider.dart';
import '../widgets/meal_card.dart';

class CategoryMealsPage extends StatelessWidget {
  final Category category;

  const CategoryMealsPage(
    this.category, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<MealsProvider>(
      context,
      listen: false,
    ).filteredMeals;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: meals.length,
        itemBuilder: (_, index) {
          debugPrint('$index/${meals.length}');
          return MealCard(meals.elementAt(index));
        },
      ),
    );
  }
}
