import 'package:flutter/material.dart';
import 'package:food_meals_app/models/meal.dart';
import 'package:food_meals_app/screens/meal_details.dart';
import 'package:food_meals_app/widgets/meal_item.dart';

//import '../widgets/category_gride_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,  this.title, required this.meals,required this.onToggleFavorite});
  final String? title;
  final List<Meal> meals;
  final void Function (Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal){
    Navigator.of(context).push(MaterialPageRoute
    (builder: (context)=>MealDetailsScreen(meal: meal,onToggleFavorite: onToggleFavorite,),),);
  }

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
          itemBuilder: (context, index) => MealItem(meal: meals[index],onSelectMeal:selectMeal));
    }
    if(title == null ){
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
