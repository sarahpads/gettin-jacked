import 'package:flutter/material.dart';
import 'package:gettin_jacked/router/delegate.dart';
import 'package:gettin_jacked/router/parsers.dart';

void main() {
  runApp(GettinJacked());
}

// this has to be stateful in order for the router delegate to persist across hot refreshes
// without the state persistence, the delegate was being replaced every reload
// https://github.com/flutter/flutter/issues/60709
class GettinJacked extends StatefulWidget {
  @override
  _GettinJackedState createState() => _GettinJackedState();
}

class _GettinJackedState extends State<GettinJacked> {
  final delegate = JackedRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routeInformationParser: JackedRouteInformationParser(),
        routerDelegate: delegate
    );
  }
}
