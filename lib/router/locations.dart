import 'package:flutter/foundation.dart';

class JackedLocationKeys {
  static const workouts = 'workout-listing';
  static const workoutDetail = 'workout-detail';
  static const workoutCurrent = 'workout-current';
  static const workoutEdit = 'workout-edit';
  static const exercises = 'exercise-listing';
  static const exerciseDetail = 'exercise-detail';
}

class JackedLocation {
  final String key;
  final String path;
  Map<String, String> params = {};

  JackedLocation({
    @required this.key,
    @required this.path,
  });

  JackedLocation.loading() :
        key = 'loading',
        path = '/';

  JackedLocation.workoutListing() :
        key = JackedLocationKeys.workouts,
        path = '/workout-listing';

  JackedLocation.workoutDetail({ @required String id }) :
        key = JackedLocationKeys.workoutDetail,
        path = '/workout-detail',
        params = { 'id': id };

  JackedLocation.workoutCurrent() :
        key = JackedLocationKeys.workoutCurrent,
        path = '/workout-current';

  JackedLocation.workoutEdit({ @required String id }) :
        key = JackedLocationKeys.workoutEdit,
        path = '/workout-edit',
        params = { 'id': id };

  JackedLocation.exerciseListing() :
        key = JackedLocationKeys.exercises,
        path = '/exercise-listing';

  JackedLocation.exerciseDetail({ @required String id }) :
        key = JackedLocationKeys.exerciseDetail,
        path = '/exercise-detail',
        params = { 'id': id };
}

