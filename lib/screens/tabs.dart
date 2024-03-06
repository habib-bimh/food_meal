import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_meals_app/data/dummy_data.dart';
import 'package:food_meals_app/models/meal.dart';
import 'package:food_meals_app/provider/meals_provider.dart';
import 'package:food_meals_app/screens/categories.dart';
import 'package:food_meals_app/screens/filters.dart';
import 'package:food_meals_app/screens/meals.dart';
import 'package:food_meals_app/widgets/main_drawer.dart';

const kInilialdFilter =  {
    Filter.gluteFree: false,
    Filter.lactoseFree:false,
    Filter.vegetarian:false,
    Filter.vegan:false
  };

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({
    super.key,
  });

  @override
 ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {

  Map<Filter, bool> _seletFilter = kInilialdFilter;

  void _showsnackbar(String messeges) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(messeges)));
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

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "Filters") {
     final result = await Navigator.of(context)
          .push<Map<Filter, bool>>(MaterialPageRoute(builder: (context) => FistersScreen(currentFilters: _seletFilter,)));
         setState(() {
            _seletFilter = result ?? kInilialdFilter ;
         });
    } else {
       
    }
     
  }
 

  @override
  Widget build(BuildContext context) {
   final meals = ref.watch(mealsProvidr);
   final availableMeale =meals.where((meal) {
    if (_seletFilter[Filter.gluteFree]! && !meal.isGlutenFree){
      return false;
    }
    if (_seletFilter[Filter.lactoseFree]! && !meal.isLactoseFree){
      return false;
    }
    if (_seletFilter[Filter.vegetarian]! && !meal.isVegetarian){
      return false;
    }
    if (_seletFilter[Filter.vegan]! && !meal.isVegan){
      return false;
    }
    return true;
   }).toList();

    Widget active = CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
      availableMeale: availableMeale,
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
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
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
