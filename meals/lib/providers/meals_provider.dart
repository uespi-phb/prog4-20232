import 'package:flutter/material.dart';

import './category.dart';
import './meals.dart';
import '../models/meal.dart';
import '../models/category.dart';

class MealsProvider with ChangeNotifier {
  final List<Category> _categories = kCategories;
  final List<Meal> _meals = kMeals;

  List<Category> get categories => _categories;
  List<Meal> get meals => _meals;

  Iterable<Meal> mealsByCategory(int id) {
    return _meals.where((meal) => meal.categories.contains(id));
  }

  void toggleFavorite(Meal meal) {
    meal.isFavorite = !meal.isFavorite;
    notifyListeners();
  }
}
