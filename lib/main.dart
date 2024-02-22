import 'package:flutter/material.dart';
//import 'package:food_meals_app/data/dummy_data.dart';
import 'package:food_meals_app/screens/categories.dart';
//import 'package:food_meals_app/screens/meals.dart';
import 'package:google_fonts/google_fonts.dart';


final theme =  ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 131, 57, 0)
    ),
    textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const CategoriesScreen(),
    );
  }
}

