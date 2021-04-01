import 'package:flutter/material.dart';

class Exercises extends StatefulWidget {
  @override
  _ExercisesState createState() => _ExercisesState();
}

class _ExercisesState extends State<Exercises> {
  final items = List<String>.generate(7, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: items.map((value) => Card(
        child: ListTile(
          leading: Container(
            alignment: Alignment.center,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.red
            ),
            child: CircleAvatar(child: Text('L'))
          ),
          title: Text('Exercise name'),
          subtitle: Text('x lbs, 5 sets x 5 reps'),
        )
      )).toList()
    );
  }
}
