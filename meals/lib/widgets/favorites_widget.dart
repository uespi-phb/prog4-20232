import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meals_provider.dart';
import './meal_card.dart';

class FavoritesWidget extends StatelessWidget {
  const FavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mealsProvider = Provider.of<MealsProvider>(
      context,
      listen: false,
    );
    final favoriteMeals = mealsProvider.favoriteMeals;

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: favoriteMeals.length,
      itemBuilder: (_, index) => MealCard(favoriteMeals[index]),
    );
  }
}
