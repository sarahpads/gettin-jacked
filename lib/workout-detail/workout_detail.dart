import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gettin_jacked/router/delegate.dart';
import 'package:gettin_jacked/router/locations.dart';
import 'package:gettin_jacked/workout-detail/details/details.dart';
import 'package:gettin_jacked/workout-detail/sessions/sessions.dart';

class WorkoutDetail extends StatelessWidget {
  WorkoutDetail({ @required String id });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Workout detail'),
          actions: [
            IconButton(icon: Icon(Icons.star), onPressed: () => {}),
            IconButton(icon: Icon(Icons.edit), onPressed: () => JackedRouterDelegate.of(context).push(JackedLocation.workoutEdit(id: '1'))),
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(child: ListTile(leading: Icon(Icons.delete), title: Text('Delete')))
              ]
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Details'),
              Tab(text: 'Sessions'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Details(),
            Sessions()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.play_arrow),
          onPressed: () => JackedRouterDelegate.of(context).push(JackedLocation.workoutCurrent())
        ),
      )
    );
  }
}


