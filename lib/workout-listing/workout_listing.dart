import 'package:flutter/material.dart';
import 'package:gettin_jacked/layout/sidebar.dart';

class WorkoutListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey('scaffold'),
      appBar: AppBar(
        title: Text('Workout Listing')
      ),
      drawer: Sidebar(),
      body: Text('workouts')
    );
  }
}


