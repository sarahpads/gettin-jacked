import 'package:flutter/material.dart';
import 'package:gettin_jacked/layout/sidebar.dart';
import 'package:gettin_jacked/router/delegate.dart';
import 'package:gettin_jacked/router/locations.dart';

class ExerciseListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _navigate(String id) {
      JackedRouterDelegate.of(context).push(JackedLocation.exerciseDetail(id: id));
    }

    return Scaffold(
      key: ValueKey('scaffold'),
      appBar: AppBar(
        title: Text('Exercise Listing')
      ),
      drawer: Sidebar(),
      body: TextButton(
        child: Text('View Exercise'),
        onPressed: () => _navigate('1'),
      )
    );
  }
}
