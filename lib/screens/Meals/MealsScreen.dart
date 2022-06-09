import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/Meals/widgets/MealItem.dart';

class MealsScreen extends StatefulWidget {
  static const String routeName = '/meal';

  final List<Meal> mealsData;

  const MealsScreen({required this.mealsData});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  List<Meal> _category_meals = [];
  late String id;
  late String title;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    id = routeArguments['id'] as String;
    title = routeArguments['title'] as String;
    _category_meals =
        widget.mealsData.where((meal) => meal.categories.contains(id)).toList();
  }

  void _removeMeal(String id) {
    setState(() {
      _category_meals = _category_meals.where((meal) => meal.id != id).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('meal'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _category_meals.length,
          itemBuilder: (context, index) {
            return MealItem(
                id: _category_meals[index].id,
                title: _category_meals[index].title,
                duration: _category_meals[index].duration,
                imageUrl: _category_meals[index].imageUrl,
                affordability: _category_meals[index].affordability,
                complexity: _category_meals[index].complexity,
                removeMeal: _removeMeal);
          },
        ),
      ),
    );
  }
}
