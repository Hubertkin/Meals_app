import 'package:delimeal_app/screens/categories_screen.dart';
import 'package:delimeal_app/screens/category_meal_screen.dart';
import 'package:delimeal_app/screens/filters_screen.dart';
import 'package:delimeal_app/screens/meal_detail_screen.dart';
import 'package:delimeal_app/screens/tab_screen.dart';
import 'package:flutter/material.dart';

import 'dummy_data.dart';
import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  
  void _toggleFavorites (String mealId)
{
  final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
  if(existingIndex >= 0)
  {
    setState(() {
      _favoriteMeals.removeAt(existingIndex);
    });
  }
  else
  {//
    setState(() {
      _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    });
  }
}
bool _isMealFavorite(String id){
  return _favoriteMeals.any((meal) => meal.id == id);
}
 


  void _setFilters(Map<String, bool> filteredData) {
    setState(() {
      _filters = filteredData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delimeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.pink, secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        useMaterial3: false,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            titleSmall: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
            )),
      ),
      // home: const CategoriesScreen(),
      initialRoute:
          '/', // default is '/' which can be changed to render a different home scrreen
      routes: {
        '/': (context) =>  TabsScreen(_favoriteMeals),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (context) =>  MealDetailScreen(_isMealFavorite,_toggleFavorites),
        FiltersScreen.routeName: (context) => FiltersScreen(_filters,_setFilters),
      },
      onGenerateRoute: (settings) {
        //this is a function that is called when a named route is called but not registered in the routes table
        // debugPrint(settings.arguments.toString());
        // MaterialPageRoute(builder: (context) => const CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        //this is a function that is called when a named route is called but not registered in the routes table and onGenerateRoute is not defined
        MaterialPageRoute(builder: (context) => const CategoriesScreen());
      },
    );
  }
}
