import 'package:flutter/foundation.dart';

class JackedLocationKeys {
  static const workouts = 'workout-listing';
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

  JackedLocation.workoutListing() :
        key = JackedLocationKeys.workouts,
        path = '/workout-listing';

  JackedLocation.exerciseListing() :
        key = JackedLocationKeys.exercises,
        path = '/exercise-listing';

  JackedLocation.exerciseDetail({ @required String id }) :
        key = JackedLocationKeys.exerciseDetail,
        path = '/exercise-detail',
        params = { 'id': id };
}

