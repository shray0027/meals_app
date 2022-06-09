import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/Recipe/widgets/ContentContainer.dart';
import 'package:meals/screens/Recipe/widgets/ToggleButton.dart';

class RecipeScreen extends StatefulWidget {
  static const String routeName = '/recipe';
  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  Meal? _mealData;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    _mealData =
        DUMMY_MEALS.where((meal) => meal.id == routeArguments['id']).first;
    print(_mealData!.ingredients);
  }

  List<bool> _toggleButtonSelectionStatus = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_mealData?.title ?? 'Error'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(_mealData!.id);
        },
        child: Icon(
          Icons.delete,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            Image.network(_mealData!.imageUrl),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  ToggleButtons(
                    children: [
                      ToggleButton(
                          icon: Icons.restaurant, description: 'Ingredients'),
                      ToggleButton(
                          icon: Icons.book, description: 'Recipe steps')
                    ],
                    isSelected: _toggleButtonSelectionStatus,
                    selectedColor: Colors.black,
                    color: Colors.grey,
                    onPressed: (index) {
                      setState(() {
                        if (index == 0) {
                          _toggleButtonSelectionStatus = [true, false];
                        } else {
                          _toggleButtonSelectionStatus = [false, true];
                        }
                      });
                    },
                    selectedBorderColor: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _toggleButtonSelectionStatus[0]
                      ? ContentContainer(
                          contentTitle: 'Ingredients',
                          content: _mealData!.ingredients)
                      : ContentContainer(
                          contentTitle: 'Recipe steps',
                          content: _mealData!.steps)
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
