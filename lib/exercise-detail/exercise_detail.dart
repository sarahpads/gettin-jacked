import 'package:flutter/material.dart';
import 'package:gettin_jacked/layout/sidebar.dart';

class ExerciseDetail extends StatelessWidget {
  ExerciseDetail({ @required String id });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Detail'),
        actions: [
          IconButton(icon: Icon(Icons.star), onPressed: () => {})
        ]
      ),
      body: Text('exercise details')
    );
  }
}
