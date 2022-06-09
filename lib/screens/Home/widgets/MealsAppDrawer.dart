import 'package:flutter/material.dart';
import 'package:meals/screens/Filters/FilterScreen.dart';

class MealsAppDrawer extends StatelessWidget {
  const MealsAppDrawer({Key? key}) : super(key: key);

  Widget _buildListTile(String title, IconData icon, tapHandler) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: tapHandler,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        _buildListTile('Meals', Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        _buildListTile('Filters', Icons.filter, () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        }),
      ]),
    );
  }
}
