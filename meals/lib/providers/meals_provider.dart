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

  List<Meal> get filteredMeals => _meals.where((meals) {
        if (_filters[MealFilter.glutenFree]! && !meals.isGlutenFree) {
          return false;
        }
        if (_filters[MealFilter.lactoseFree]! && !meals.isLactoseFree) {
          return false;
        }

        if (_filters[MealFilter.vegetarian]! && !meals.isVegetarian) {
          return false;
        }

        if (_filters[MealFilter.vegan]! && !meals.isVegan) {
          return false;
        }

        return true;
      }).toList();

  List<Meal> get favoriteMeals =>
      _meals.where((meal) => meal.isFavorite).toList();

  bool getFilterState(MealFilter mealFilter) => _filters[mealFilter] ?? false;

  void setFilterState(MealFilter mealFilter, bool value) {
    // debugPrint('${mealFilter.name}: ${_filters[mealFilter]}');
    _filters[mealFilter] = value;
    // debugPrint('${mealFilter.name}: ${_filters[mealFilter]}');

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
