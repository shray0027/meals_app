import 'package:flutter/material.dart';
import 'package:meals/screens/Home/widgets/MealsAppDrawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen(
      {required this.saveFilters, required this.currentFilters});

  static const routeName = '/filters';
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  @override
  void initState() {
    super.initState();
    isGlutenFree = widget.currentFilters['gluten'] as bool;
    isLactoseFree = widget.currentFilters['lactose'] as bool;
    isVegetarian = widget.currentFilters['vegetarian'] as bool;
    isVegan = widget.currentFilters['vegan'] as bool;
  }

  Widget _buildSwitchTile(
      String title, String description, bool currVal, Function handleChange) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currVal,
      onChanged: (newVal) => handleChange(newVal),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: () {
              final selectedFilters = {
                'gluten': isGlutenFree,
                'lactose': isLactoseFree,
                'vegan': isVegan,
                'vegetarian': isVegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MealsAppDrawer(),
      body: ListView(
        children: [
          _buildSwitchTile(
            "Gluten-free",
            'only include gluten free meals',
            isGlutenFree,
            (newVal) => setState(() => isGlutenFree = newVal),
          ),
          _buildSwitchTile(
            "Lactose-free",
            'only include lactose free meals',
            isLactoseFree,
            (newVal) => setState(() => isLactoseFree = newVal),
          ),
          _buildSwitchTile(
            "Vegan",
            'only include vegan meals',
            isVegan,
            (newVal) => setState(() => isVegan = newVal),
          ),
          _buildSwitchTile(
            "Vegetarian",
            'only include vegetarian meals',
            isVegetarian,
            (newVal) => setState(() => isVegetarian = newVal),
          ),
        ],
      ),
    );
  }
}
