import 'package:flutter/material.dart';
import 'package:meals/screens/Home/widgets/MealsAppDrawer.dart';
import 'package:meals/screens/Categories/CategoriesScreen.dart';
import 'package:meals/screens/Favourites/FavouritesScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouritesScreen(), 'title': 'Favourites'},
  ];

  void _selectPage(int index) => setState(() {
        _selectedIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title'] as String),
      ),
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
      ),
      drawer: MealsAppDrawer(),
    );
  }
}
