enum Complexity {
  simple,
  medium,
  difficult;

  String get string {
    const names = ['Simples', 'Média', 'Alta'];
    return names[index];
  }
}

enum Cost {
  cheap('Barato'),
  fair('Normal'),
  expensive('Caro');

  const Cost(this.string);
  final String string;
}

class Meal {
  final int id;
  final String title;
  final String imageUrl;
  final List<int> categories;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Cost cost;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  bool isFavorite;

  Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.categories,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.cost,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    this.isFavorite = false,
  });
}
