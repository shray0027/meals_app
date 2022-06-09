import 'package:flutter/material.dart';

class IconSet extends StatelessWidget {
  final IconData icon;
  final String description;

  IconSet({required this.icon, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 6,
        ),
        Text(description)
      ],
    );
  }
}
