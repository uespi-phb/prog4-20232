import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard(
    this.meal, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Image.network(
          meal.imageUrl,
          height: 200.0,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
