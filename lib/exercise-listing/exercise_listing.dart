import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gettin_jacked/layout/sidebar.dart';
import 'package:gettin_jacked/router/delegate.dart';
import 'package:gettin_jacked/router/locations.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExerciseListing extends StatefulWidget {
  @override
  _ExerciseListingState createState() => _ExerciseListingState();
}

class _ExerciseListingState extends State<ExerciseListing> {
  int count = 0;
  Future<List<Group>> _loadExercises;

  initState() {
    super.initState();
    _loadExercises = loadExercises(context);
  }

  @override
  Widget build(BuildContext context) {
    void _navigate(String id) {
      JackedRouterDelegate.of(context).push(JackedLocation.exerciseDetail(id: id));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Exercises'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () => setState(() => count++))
        ]
      ),
      drawer: Sidebar(),
      body: FutureBuilder(
        future: _loadExercises,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Text('loading');
          }

          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return Column(
            children: snapshot.data.map<Widget>((group) => Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: 50.0,
                    child: ListTile(title: CircleAvatar(child: Text(
                      group.label
                    )))
                  ),
                  Expanded(
                    child: Column(
                      children: group.exercises.map<Widget>((exercise) =>
                        ListTile(
                          title: Text(exercise.title),
                          onTap: () => _navigate(exercise.id)
                        )
                      ).toList()
                    )
                  )
                ]
              )
            )).toList()
          );
        }
      )
    );
  }
}

class Exercise {
  final String title;
  final String muscleGroup;
  final String id;

  Exercise({ @required this.title, @required this.muscleGroup, @required this.id });

  Exercise.fromJson(Map<String, dynamic> data) :
    title = data['title'],
    muscleGroup = data['muscleGroup'],
    id = data['id'];
}

class Group {
  final String label;
  final List<Exercise> exercises;

  Group({ @required this.label, @required this.exercises });
}

Future<List<Group>> loadExercises(BuildContext context) async {
  String data = await DefaultAssetBundle.of(context).loadString('assets/exercises.json');
  Map<String, dynamic> json = await jsonDecode(data);
  Map<String, List<Exercise>> groups = {};

  json['exercises'].forEach((data) {
    Exercise exercise = Exercise.fromJson(data);
    String key = exercise.muscleGroup.substring(0, 1);

    if (groups.containsKey(key)) {
      groups.update(key, (value) {
        value.add(exercise);
        return value;
      });
    } else {
      groups[key] = [exercise];
    }
  });

  return groups.entries
      .map((group) => Group(label: group.key, exercises: group.value))
      .toList()
      ..sort((a, b) => a.label.compareTo(b.label));
}
