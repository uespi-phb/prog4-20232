import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

import './category.dart';
import './meals.dart';

class Database {
  static final _categories = kCategories;
  static final _meals = kMeals;

  static List<Category> get categories => _categories;

  static Iterable<Meal> mealsByCategory(int id) {
    return _meals.where((meal) => meal.categories.contains(id));
  }
}
