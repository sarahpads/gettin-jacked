import 'package:flutter/material.dart';
import 'package:gettin_jacked/workout-detail/sessions/session_item.dart';

class Sessions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SessionItem()
      ]
    );
  }
}
