import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        centerTitle: true,
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
