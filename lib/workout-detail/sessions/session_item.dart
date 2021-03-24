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
              subtitle: Text('Duration: 45 minutes'),
            ),
            LineChart()
          ]
        )
      )
    );
  }
}
