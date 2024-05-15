import 'package:delimeal_app/screens/favorites_screen.dart';
// This file returns a widget that displays tabs at the bottom of the AppBar

import './categories_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Meals'),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ), Tab(icon: Icon(Icons.star),text: 'Favorites',)
            ]),
          ),
          body: const TabBarView(children: [CategoriesScreen(),FavoritesScreen()]),
        ));
  }
}
