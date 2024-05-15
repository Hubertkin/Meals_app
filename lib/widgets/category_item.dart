
import 'package:delimeal_app/screens/category_meal_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.id, this.title, this.color);
  void selectCategory(BuildContext ctx) {
    // // ctx is context flutter requires to navigate to another screen
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //   // _ to represent the context that we don't need but flutter does need
    //   return  CategoryMealScreen(id, title);
    // }));
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName, arguments: {  //categorymealscreen.routeName is a static property that refers to the route name for categorymealscreenpage
      'id': id,
      'title': title,
    });
  } // a function to navigate to the category meal screen

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
