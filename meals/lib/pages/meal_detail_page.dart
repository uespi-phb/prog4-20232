import 'package:flutter/material.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:provider/provider.dart';

import '../models/meal.dart';
import '../widgets/info_widget.dart';

class MealDetailPage extends StatelessWidget {
  final Meal meal;

  const MealDetailPage(
    this.meal, {
    super.key,
  });

  List<Widget> _buildIgredientsList() {
    return meal.ingredients
        .map(
          (text) => Text(text),
        )
        .toList();
  }

  List<Widget> _buildStepsList() {
    return meal.steps
        .map(
          (text) => Text(text),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('MealDetailPage.build()');

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber.shade400,
        foregroundColor: Colors.grey.shade700,
        child: Consumer<MealsProvider>(
          builder: (_, __, ___) {
            debugPrint('Consumer.Star');
            return Icon(
              meal.isFavorite ? Icons.star : Icons.star_border_outlined,
            );
          },
        ),
        onPressed: () {
          final mealsProvider = Provider.of<MealsProvider>(
            context,
            listen: false,
          );
          mealsProvider.toggleFavorite(meal);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 250.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            InfoWidget(
              title: 'Ingredientes',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildIgredientsList(),
              ),
            ),
            InfoWidget(
              title: 'Passos',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildStepsList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
