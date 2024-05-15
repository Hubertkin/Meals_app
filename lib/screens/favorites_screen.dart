import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_items.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('My Favorites'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) => MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
           // removeItem: _removeMeal
            ),
        itemCount: favoriteMeals.length,
      );
    }
  }
}
