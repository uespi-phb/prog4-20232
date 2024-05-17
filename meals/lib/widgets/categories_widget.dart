import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meals_provider.dart';
import './category_card.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mealsProvider = Provider.of<MealsProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          childAspectRatio: 3 / 2,
        ),
        children: mealsProvider.categories
            .map((category) => CategoryCard(category))
            .toList(),
      ),
    );
  }
}
