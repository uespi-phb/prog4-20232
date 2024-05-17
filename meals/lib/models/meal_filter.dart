enum MealFilter {
  glutenFree(
    name: 'Sem Glúten',
    description: 'Só exibe refeições sem glúten',
  ),
  lactoseFree(
    name: 'Sem Lactose',
    description: 'Só exibe refeições sem lactose',
  ),
  vegetarian(
    name: 'Vegetariano',
    description: 'Só exibe refeições vegetarianas',
  ),
  vegan(
    name: 'Vegano',
    description: 'Só exibe refeições veganas',
  );

  const MealFilter({
    required this.name,
    required this.description,
  });

  final String name;
  final String description;
}
