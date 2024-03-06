 import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_meals_app/data/dummy_data.dart';

final mealsProvidr = Provider((ref) {return dummyMeals;});