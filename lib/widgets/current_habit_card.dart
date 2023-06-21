import 'package:flutter/material.dart';

class CurrentHabitCard extends StatelessWidget {
  const CurrentHabitCard(
      {super.key, required this.habitName, required this.habitIcon});
  final String habitName;
  final Icon habitIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Checkbox(value: false, onChanged: null),
          Text(habitName),
          habitIcon,
        ],
      ),
    );
  }
}
