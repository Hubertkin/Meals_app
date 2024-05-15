import 'package:delimeal_app/screens/favorites_screen.dart';
import 'package:delimeal_app/widgets/main_drawer.dart';

import '../models/meal.dart';
import './categories_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
   TabsScreen(this.favoriteMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> pages;
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  void initState() {
    pages= [
    {'pages': const CategoriesScreen(), 'title': 'Categories'},
    {'pages':  FavoritesScreen(widget.favoriteMeals), 'title': 'Your Favorites'}
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: pages[_selectedPageIndex]["pages"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor:
            Colors.white, // to configure the unselected tab color
        selectedItemColor: Theme.of(context)
            .colorScheme
            .secondary, // to configure selected tab color
        currentIndex:
            _selectedPageIndex, // since the selected page is control and instansiated by the developer, it has to inform BottomNavigation the currentIndex to update the tab colors
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
