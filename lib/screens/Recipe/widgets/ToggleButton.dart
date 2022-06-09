import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  final IconData icon;
  final String description;
  const ToggleButton({required this.icon, required this.description});
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 6,
          ),
          Text(
            description,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
