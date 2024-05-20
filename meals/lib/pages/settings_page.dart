import 'package:flutter/material.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:provider/provider.dart';

import '../models/meal_filter.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('SettingsPage.build()');

    final filters = MealFilter.values.map(
      (mealFilter) => Consumer<MealsProvider>(
        builder: (_, mealsProvider, __) => SwitchListTile(
          value: mealsProvider.getFilterState(mealFilter),
          title: Text(mealFilter.name),
          subtitle: Text(mealFilter.description),
          onChanged: (flag) {
            mealsProvider.setFilterState(mealFilter, flag);
          },
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Text(
              'Filtros',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          ...filters,
        ],
      ),
    );
  }
}
