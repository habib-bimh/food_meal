import 'package:flutter/material.dart';
import 'package:food_meals_app/models/meal.dart';
import 'package:food_meals_app/screens/categories.dart';
import 'package:food_meals_app/screens/meals.dart';
import 'package:food_meals_app/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({
    super.key,
  });

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  void _showsnackbar(String messeges){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(messeges)));
  }
  final List<Meal> _fevoriteMeals = [];
  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _fevoriteMeals.contains(meal);
    if (isExisting) {
     setState(() {
        _fevoriteMeals.remove(meal);
     });
     _showsnackbar("Meal is no longer a favorite.");
    } else {
      setState(() {
        _fevoriteMeals.add(meal);
        _showsnackbar("Marked as a favorite!");
      });
    }
  }

  int _selectedPageIindex = 0;
  void _seletPage(int index) {
    setState(() {
      _selectedPageIindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget active = CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
    );
    var activepageTitel = "Categoris";
    if (_selectedPageIindex == 1) {
      active = MealsScreen(
        meals: _fevoriteMeals,
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activepageTitel = "Your Favorites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activepageTitel),
      ),
      drawer: MainDrawer(),
      body: active,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _seletPage,
        currentIndex: _selectedPageIindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categoris"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
    );
  }
}
