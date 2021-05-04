import 'package:flutter/material.dart';

class WorkoutCurrent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer 0:00'),
        actions: [
          TextButton(child: Text('Start'), onPressed: () => {})
        ],
      ),
    );
  }
}
