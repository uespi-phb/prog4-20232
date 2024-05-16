import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../providers/meals_provider.dart';
import '../widgets/category_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mealsProvider = Provider.of<MealsProvider>(
      context,
      listen: false,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
        centerTitle: true,
      ),
      body: Padding(
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
      ),
    );
  }
}
