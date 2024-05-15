
import 'package:delimeal_app/widgets/meal_items.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;  

  const CategoryMealScreen(this.availableMeals, );

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

String? categoryTitle;
List<Meal> displayedMeals = [];
  @override
  void initState() {
    //....
    super.initState();
  }
  @override
  void didChangeDependencies() { //this is to cater for the error of initstate being initialized before the context is available, which causes an error
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
     displayedMeals= widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
        debugPrint('displayedMeals: Called');
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle!)),
        body: ListView.builder(
          itemBuilder: (ctx, index) => MealItem(
            id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              removeItem: _removeMeal),
          itemCount: displayedMeals.length,
        ));
  }
}
