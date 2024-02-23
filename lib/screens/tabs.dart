import 'package:flutter/material.dart';
import 'package:food_meals_app/screens/categories.dart';
import 'package:food_meals_app/screens/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key,});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIindex = 0;
  void _seletPage(int index){
    setState(() {
      _selectedPageIindex=index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    Widget active = const CategoriesScreen();
    var activepageTitel = "Categoris";
    if (_selectedPageIindex == 1){
      active = const  MealsScreen(meals:[]);
      activepageTitel = "Your Favorites";
    }
    return Scaffold(
      appBar: AppBar(title: Text(activepageTitel),),
      body: active,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _seletPage,
        currentIndex: _selectedPageIindex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: "Categoris"),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: "Favorites"),
        ],
      ),
    );
  }
}