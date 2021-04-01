import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gettin_jacked/router/locations.dart';

class JackedRouteInformationParser extends RouteInformationParser<JackedLocation> {
  @override
  Future<JackedLocation> parseRouteInformation(RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location);
    JackedLocation location;

    print('parsing route');
    print(uri);

    String path = uri.pathSegments.isNotEmpty
        ? uri.pathSegments[0]
        : JackedLocationKeys.workouts;

    switch (path) {
      case JackedLocationKeys.exercises:
        location = JackedLocation.exerciseListing();
        break;

      case JackedLocationKeys.exerciseDetail:
        location = JackedLocation.exerciseDetail(id: uri.pathSegments[1]);
        break;

      case JackedLocationKeys.workoutDetail:
        location = JackedLocation.workoutDetail(id: uri.pathSegments[1]);
        break;

      case JackedLocationKeys.workoutCurrent:
        location = JackedLocation.workoutCurrent();
        break;

      case JackedLocationKeys.workoutEdit:
        location = JackedLocation.workoutEdit(id: uri.pathSegments[1]);
        break;

      case JackedLocationKeys.workouts:
      default:
        location = JackedLocation.workoutListing();
        break;
    }

    return SynchronousFuture(location ?? JackedLocation.workoutListing());
  }

  @override
  RouteInformation restoreRouteInformation(JackedLocation location) {
    print('restoring route');
    print(location.key);
    return RouteInformation(location: location.path);
  }
}

