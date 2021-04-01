import 'package:flutter/material.dart';
import 'package:gettin_jacked/workout-detail/sessions/line_chart.dart';

class SessionItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('March 23 2020'),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 10.0),
              child: Row(
                children: [
                  Icon(Icons.timer),
                  SizedBox(width: 5),
                  Text('45 min'),
                  SizedBox(width: 10),
                  Icon(Icons.fitness_center),
                  SizedBox(width: 5),
                  Text('450 lb')
                ]
              ),
            ),
            LineChart()
          ]
        )
      )
    );
  }
}
