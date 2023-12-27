import 'package:gym_app/models/exercice.dart';

class Workout {
  final String name;
  final List<Exercise> exercices;

  Workout({
    required this.name,
    required this.exercices,
  });
}
