
import 'package:flutter/material.dart';
import 'package:food_meals_app/data/dummy_data.dart';
import 'package:food_meals_app/widgets/category_gride_item.dart';
import 'package:food_meals_app/screens/meals.dart';
import 'package:food_meals_app/models/category.dart';



class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filterdMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MealsScreen(
              title:category.title,
              meals:filterdMeals,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
          padding: EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            for (final category in availableCategories)
              CategoryGridItem(
                  category: category,
                  onSelectCalegory: () => _selectCategory(context,category))
          ]);
    
  }
}
