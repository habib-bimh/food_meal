
import 'package:flutter/material.dart';
import 'package:food_meals_app/data/dummy_data.dart';
import 'package:food_meals_app/models/meal.dart';
import 'package:food_meals_app/widgets/category_gride_item.dart';
import 'package:food_meals_app/screens/meals.dart';
import 'package:food_meals_app/models/category.dart';



class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.onToggleFavorite, required this.availableMeale});
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeale;
  void _selectCategory(BuildContext context, Category category) {
    final filterdMeals = availableMeale
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MealsScreen(
              title:category.title,
              meals:filterdMeals,
              onToggleFavorite: onToggleFavorite,
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
