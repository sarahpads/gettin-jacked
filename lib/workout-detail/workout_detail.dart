import 'dart:async';

import 'package:flutter/material.dart';
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
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(child: ListTile(leading: Icon(Icons.edit), title: Text('Edit'))),
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
          onPressed: () => {}
        ),
      )
    );
  }
}


