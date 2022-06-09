import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/Filters/FilterScreen.dart';
import 'package:meals/screens/Home/HomeScreen.dart';
import 'package:meals/screens/Meals/MealsScreen.dart';
import 'package:meals/screens/Recipe/RecipeScreen.dart';

void main() => runApp(MealsApp());

const Map<int, Color> color = {
  50: Color.fromRGBO(0, 0, 0, .1),
  100: Color.fromRGBO(0, 0, 0, .2),
  200: Color.fromRGBO(0, 0, 0, .3),
  300: Color.fromRGBO(0, 0, 0, .4),
  400: Color.fromRGBO(0, 0, 0, .5),
  500: Color.fromRGBO(0, 0, 0, .6),
  600: Color.fromRGBO(0, 0, 0, .7),
  700: Color.fromRGBO(0, 0, 0, .8),
  800: Color.fromRGBO(0, 0, 0, .9),
  900: Color.fromRGBO(0, 0, 0, 1),
};

class MealsApp extends StatefulWidget {
  MealsApp({Key? key}) : super(key: key);

  @override
  State<MealsApp> createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  final MaterialColor colorCustom = MaterialColor(0xFF000000, color);

  List<Meal> _availableMeals = DUMMY_MEALS;

  Map<String, bool> _filters = {
    "vegan": false,
    "vegetarian": false,
    "gluten": false,
    "lactose": false,
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
    });
    print(_filters);
    _availableMeals = DUMMY_MEALS.where((meal) {
      if (_filters['gluten'] as bool && !meal.isGlutenFree) {
        return false;
      }
      if (_filters['lactose'] as bool && !meal.isLactoseFree) {
        return false;
      }
      if (_filters['vegan'] as bool && !meal.isVegan) {
        return false;
      }
      if (_filters['vegetarian'] as bool && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meals App",
      theme: ThemeData(
        primarySwatch: colorCustom,
        primaryColor: colorCustom,
        accentColor: Color.fromARGB(255, 208, 80, 114),
        canvasColor: Color.fromARGB(255, 228, 228, 228),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: TextStyle(
                // fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (context) => HomeScreen(),
        MealsScreen.routeName: (context) =>
            MealsScreen(mealsData: _availableMeals),
        RecipeScreen.routeName: (context) => RecipeScreen(),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(saveFilters: _setFilters, currentFilters: _filters)
      },
    );
  }
}
