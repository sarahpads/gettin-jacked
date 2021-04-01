import 'package:flutter/material.dart';
import 'package:gettin_jacked/router/delegate.dart';
import 'package:gettin_jacked/router/locations.dart';

class WorkoutItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('Workout Name'),
            subtitle: Text('Musclegroup1, Musclegroup2, Musclegroup3'),
            trailing: IconButton(icon: Icon(Icons.star), onPressed: () => {})
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton(
                child: Text('View'),
                onPressed: () => { JackedRouterDelegate.of(context).push(JackedLocation.workoutDetail(id: '1')) },
              ),
              TextButton.icon(
                icon: Icon(Icons.play_arrow),
                label: Text('Resume'), // or start
                onPressed: () => JackedRouterDelegate.of(context).push(JackedLocation.workoutCurrent())
              )
            ]
          )
        ]
      )
    );
  }
}
