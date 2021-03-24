import 'package:flutter/material.dart';
import 'package:gettin_jacked/workout-detail/details/donut_chart.dart';
import 'package:gettin_jacked/workout-detail/details/exercises.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        children: [
          WorkoutChart(),
          Exercises()
        ]
    );
  }
}

