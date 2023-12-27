import 'package:flutter/material.dart';
import 'package:gym_app/models/exercice.dart';
import 'package:gym_app/models/workout.dart';

class WorkoutData extends ChangeNotifier {
  /*

  Workout Data Structure

  --this overal list contains the diferente workouts
  --each workout has a name, and list of exercices 

  */

  List<Workout> workoutList = [
    //default workout
    Workout(name: "Upper Boddy", exercises: [
      Exercise(name: "Biceps Curls", weight: "10", sets: "10", reps: "10")
    ])
  ];

  // get the list of workouts
  List<Workout> getWorkoutList() {
    return workoutList;
  }

  //get the lenght of the
  int numberOfExercisesInWorkout(String workoutName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    return relevantWorkout.exercises.length;
  }

  //add a workout
  void addWorkout(String name) {
    workoutList.add(Workout(name: name, exercises: []));

    notifyListeners();
  }

  //add a exercise to workout
  void addExercise(
    String workoutName,
    String exerciseName,
    String weight,
    String reps,
    String sets,
  ) {
    //find a revelant workout
    Workout revelantWorkout = getRelevantWorkout(workoutName);

    revelantWorkout.exercises.add(
        Exercise(name: workoutName, weight: weight, sets: sets, reps: reps));

    notifyListeners();
  }

  //check the erxercise once is done
  void chekOffExercise(String workoutName, String exerciseName) {
    //find a relevant workout
    Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);

    //check of boolean to show user completed the exercise
    relevantExercise.isCompleted = !relevantExercise.isCompleted;

    notifyListeners();
  }

  //return a relevant workout object, given the workout name
  Workout getRelevantWorkout(String workoutName) {
    Workout revelantWorkout =
        workoutList.firstWhere((workout) => workout.name == workout.name);

    return revelantWorkout;
  }

  //return a relevant exercise object, given the workoutname + exercise name
  Exercise getRelevantExercise(
    String workoutName,
    String exerciseName,
  ) {
    //find a relevant workout
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    //find a relevant exercise in the workout
    Exercise relevantExercise = relevantWorkout.exercises
        .firstWhere((exercises) => exerciseName == exerciseName);

    return relevantExercise;
  }
}
