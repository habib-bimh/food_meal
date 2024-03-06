import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_meals_app/models/meal.dart';
class FavoriteMealsProvider extends StateNotifier<List<Meal>>{
  FavoriteMealsProvider() : super([]);

 void toggleMealFavoriteStatus (Meal meal){
      final mealIsFavorit = state.contains(meal);
      if(mealIsFavorit){
       state = state.where((m) => m.id != meal.id).toList();
      }else{
        state = [...state, meal];
      }
 }

}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsProvider ,List<Meal>>((ref){
  return FavoriteMealsProvider();
});