
import 'package:flutter/material.dart';
import 'package:gettin_jacked/router/delegate.dart';
import 'package:gettin_jacked/router/locations.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _navigate(JackedLocation location) {
      // navigate to new page
      JackedRouterDelegate.of(context).push(location);

      /*
      // unsuccessful attempt to close the drawer after the next state has animated in
      var route = ModalRoute.of(context);

      void handler(status) {
        print(status);
        if (status == AnimationStatus.completed) {
          route.animation.removeStatusListener(handler);
          // close the drawer
          Navigator.of(context).pop();
        }
      }
      route.animation.addStatusListener(handler);
      */
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(child: Text('Sidebar')),
          ListTile(
            title: Text('Workouts'),
            onTap: () => _navigate(JackedLocation.workoutListing()),
          ),
          ListTile(
            title: Text('Exercises'),
            onTap: () => _navigate(JackedLocation.exerciseListing()),
          )
        ],
      )
    );
  }
}
