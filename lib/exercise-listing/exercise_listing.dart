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
      appBar: AppBar(
        title: Text('Exercise Listing'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () => {})
        ]
      ),
      drawer: Sidebar(),
      body: ListView(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: 50.0,
                  child: Icon(Icons.star),
                ),
                Expanded(
                  child: Column(
                    children: [
                      ListTile(
                          title: Text('Exercise title'),
                          onTap: () => _navigate('1')
                      ),
                      ListTile(
                          title: Text('Another Exercise'),
                          onTap: () => {}
                      ),
                      ListTile(
                          title: Text('Another Exercise'),
                          onTap: () => {}
                      ),
                      ListTile(
                          title: Text('Another Exercise'),
                          onTap: () => {}
                      ),
                      ListTile(
                          title: Text('Another Exercise'),
                          onTap: () => {}
                      ),
                      ListTile(
                          title: Text('Another Exercise'),
                          onTap: () => {}
                      ),
                    ]
                  )
                )
              ]
            )
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: 50.0,
                  child: Text('A')
                ),
                Expanded(
                  child: Column(
                    children: [
                      ListTile(
                          title: Text('Another Exercise'),
                          onTap: () => {}
                      ),
                      ListTile(
                          title: Text('Another Exercise'),
                          onTap: () => {}
                      ),
                      ListTile(
                          title: Text('Another Exercise'),
                          onTap: () => {}
                      ),
                      ListTile(
                          title: Text('Another Exercise'),
                          onTap: () => {}
                      ),
                      ListTile(
                          title: Text('Another Exercise'),
                          onTap: () => {}
                      ),
                      ListTile(
                          title: Text('Another Exercise'),
                          onTap: () => {}
                      ),
                      ListTile(
                          title: Text('Another Exercise'),
                          onTap: () => {}
                      ),
                    ]
                  )
                )
              ]
            )
          )
        ],
      )
    );
  }
}
