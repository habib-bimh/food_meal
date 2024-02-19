import 'package:flutter/material.dart';
import 'package:food_meals_app/models/meal.dart';
import 'package:food_meals_app/widgets/meal_item.dart';

//import '../widgets/category_gride_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});
  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Uh oh ..... nothing here!",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          Text(
            "Try selecting different category!",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
          itemBuilder: (context, index) => MealItem(meal: meals[index],));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
