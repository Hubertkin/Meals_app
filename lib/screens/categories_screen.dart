import 'package:delimeal_app/widgets/category_item.dart';
import 'package:delimeal_app/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(   //This is commented because the category screen form part of the TabsScreen Scaffold so this Scaffold is not necessary
    //   appBar: AppBar(
    //     title: const Text('Delimeals'),
    //   ),
    //   body:
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map((catData) =>
              CategoryItem(catData.id, catData.title, catData.color))
          .toList(),
    );
  }
}
