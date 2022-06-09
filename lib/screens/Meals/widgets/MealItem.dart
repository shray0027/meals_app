import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/Meals/widgets/IconSet.dart';
import 'package:meals/screens/Recipe/RecipeScreen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final int duration;
  final String imageUrl;
  final Affordability affordability;
  final Complexity complexity;
  final Function removeMeal;

  const MealItem(
      {required this.id,
      required this.title,
      required this.duration,
      required this.imageUrl,
      required this.affordability,
      required this.complexity,
      required this.removeMeal});

  String _getAffordabilityText() {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Nan';
    }
  }

  void _sendToRecipe(BuildContext context) {
    Navigator.of(context).pushNamed(RecipeScreen.routeName,
        arguments: {'id': id}).then((result) {
      result != null ? removeMeal(result) : null;
    });
  }

  String _getComplexityText() {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Nan';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _sendToRecipe(context),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconSet(
                    icon: Icons.work,
                    description: _getComplexityText(),
                  ),
                  IconSet(
                    icon: Icons.schedule,
                    description: '$duration min',
                  ),
                  IconSet(
                    icon: Icons.attach_money,
                    description: _getAffordabilityText(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
