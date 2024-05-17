import 'package:flutter/material.dart';

import '../models/meal_filter.dart';
import './category.dart';
import './meals.dart';
import '../models/meal.dart';
import '../models/category.dart';

class MealsProvider with ChangeNotifier {
  final List<Category> _categories = kCategories;
  final List<Meal> _meals = kMeals;
  final Map<MealFilter, bool> _filters = {};

  MealsProvider() {
    for (var mealFilter in MealFilter.values) {
      _filters[mealFilter] = false;
    }
  }

  List<Category> get categories => _categories;
  List<Meal> get meals => _meals;
  List<Meal> get favoriteMeals =>
      _meals.where((meal) => meal.isFavorite).toList();

  bool getFilter(MealFilter mealFilter) => _filters[mealFilter]!;
  void setFilter(MealFilter mealFilter, bool value) {
    _filters[mealFilter] = value;
    notifyListeners();
  }

  Iterable<Meal> mealsByCategory(int id) {
    return _meals.where((meal) => meal.categories.contains(id));
  }

  void toggleFavorite(Meal meal) {
    meal.isFavorite = !meal.isFavorite;
    notifyListeners();
  }
}
