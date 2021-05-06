import 'package:flutter/material.dart';
import 'package:gettin_jacked/database/workout_table.dart';
import 'package:gettin_jacked/layout/sidebar.dart';
import 'package:gettin_jacked/workout-listing/workout_item.dart';

class WorkoutListing extends StatefulWidget {
  const WorkoutListing({Key key}) : super(key: key);

  @override
  _WorkoutListingState createState() => _WorkoutListingState();
}

class _WorkoutListingState extends State<WorkoutListing> {
  WorkoutTable data = WorkoutTable();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Listing')
      ),
      drawer: Sidebar(),
      body: FutureBuilder(
        future: data.getAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Text('loading');
          }

          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.data.isEmpty) {
            return Text('No workouts');
          }

          return ListView(
            children: snapshot.data.map<Widget>((workout) => WorkoutItem()).toList()
          );
        }
      )
    );
  }
}
