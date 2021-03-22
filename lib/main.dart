import 'package:flutter/material.dart';
import 'package:gettin_jacked/router/delegate.dart';
import 'package:gettin_jacked/router/parsers.dart';

void main() {
  runApp(GettinJacked());
}

class GettinJacked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routeInformationParser: JackedRouteInformationParser(),
        routerDelegate: JackedRouterDelegate()
    );
  }
}

