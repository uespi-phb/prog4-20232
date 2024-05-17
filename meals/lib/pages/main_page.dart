import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../widgets/categories_widget.dart';
import '../widgets/favorites_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

enum MealsPage {
  categories,
  favorites,
}

class _MainPageState extends State<MainPage> {
  MealsPage _mealsPage = MealsPage.categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      // body: CategoriesWidget(mealsProvider: mealsProvider),
      body: (_mealsPage == MealsPage.categories)
          ? const CategoriesWidget()
          : const FavoritesWidget(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        currentIndex: _mealsPage.index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
        onTap: (index) {
          setState(() {
            _mealsPage = MealsPage.values[index];
          });
        },
      ),
    );
  }
}
