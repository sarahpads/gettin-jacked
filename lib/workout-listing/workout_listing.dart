import 'package:flutter/material.dart';
import 'package:gettin_jacked/layout/sidebar.dart';
import 'package:gettin_jacked/workout-listing/workout_item.dart';

class WorkoutListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Listing')
      ),
      drawer: Sidebar(),
      body: ListView(
        children: [
          WorkoutItem()
        ]
      )
    );
  }
}


