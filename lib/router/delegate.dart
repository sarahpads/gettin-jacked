import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gettin_jacked/exercise-detail/exercise_detail.dart';
import 'package:gettin_jacked/exercise-listing/exercise_listing.dart';
import 'package:gettin_jacked/router/locations.dart';
import 'package:gettin_jacked/workout-listing/workout_listing.dart';

class JackedRouterDelegate extends RouterDelegate<JackedLocation> with PopNavigatorRouterDelegateMixin<JackedLocation>, ChangeNotifier {
  // TODO: this overrides the page on each refresh
  final _stack = <JackedLocation>[JackedLocation.workoutListing()];

  static JackedRouterDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    return delegate as JackedRouterDelegate;
  }

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  JackedLocation get currentConfiguration => _stack.isNotEmpty ? _stack.last : null;

  List<JackedLocation> get stack => List.unmodifiable(_stack);

  @override
  Future<void> setInitialRoutePath(JackedLocation location) {
    return setNewRoutePath(location);
  }

  @override
  Future<void> setNewRoutePath(JackedLocation location) {
    _stack
      ..add(location);

    return SynchronousFuture<void>(null);
  }

  void push(JackedLocation newRoute) {
    _stack.add(newRoute);
    notifyListeners();
  }

  void remove(String routeName) {
    _stack.remove(routeName);
    notifyListeners();
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    // make sure that the pop wasn't already handled by a downstream state
    // this will return false if the pop was already handled
    if (!route.didPop(result)) {
      return false;
    }

    if (_stack.isNotEmpty) {
      _stack.removeLast();
      notifyListeners();
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        onPopPage: _onPopPage,
        pages: _stack.map((location) {
          switch (location.key) {
          // https://github.com/flutter/flutter/issues/26954
          // by setting maintainState to false, we make sure the previous screen is torn down
          // this includes the blasted Scaffold/Drawer widget, which would either
          // 1. animate out while animating in the new screen, which looked back or
          // 2. the drawer would remain open when the user navigated back to the previous screen, since its state was kept in memory
          // other things I tried:
          // - disabling the animation entirely by wrapping each of these in a custom page, which used PageRouteBuilder in order to remove animations
          // - giving the Scaffolds the same key so that the element would persist(?) and have a smooth transition
          // - listening to the animation status and collapsing the drawer once that is done; allowing us to keep that page in memory without the
          //   drawer moving about or not buggering off. This didn't work because the ModalRoute available to the Scaffold is the one containing
          //   the drawer, not the one navigating in, so there was no easy way to listen for the transition
          // - a blind, dumb timeout in the Sidebar widget which delays the closing of the drawer by a random amount of time, hoping
          //   that the child animation is done and the drawer closing animation won't be visible, but that causes the Navigator.pop
          //   method to tear down the route we're transitioning to, rather than the nested drawer state
          // the best way to handle is to probably have these exist as pageless routes or as a nested router, so that the single drawer can
          // service all of these pages

            case JackedLocationKeys.workouts:
              return MaterialPage(child: WorkoutListing(), key: ValueKey(location.key), maintainState: false);

            case JackedLocationKeys.exercises:
              return MaterialPage(child: ExerciseListing(), key: ValueKey(location.key), maintainState: false);

            case JackedLocationKeys.exerciseDetail:
              return MaterialPage(child: ExerciseDetail(id: location.params['id']), key: ValueKey(location.key));
          }
        }).toList()
    );
  }
}
