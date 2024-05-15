import 'package:flutter/material.dart';

import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen(this.favoriteMeals,  {super.key});

  @override
  Widget build(BuildContext context) {
    return const  Center(child: Text('My Favorites'),);
  }
}