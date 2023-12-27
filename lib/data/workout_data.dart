import 'package:gym_app/models/exercice.dart';
import 'package:gym_app/models/workout.dart';

class WorkoutData {
  /*

  Estrutura de Dados para Treinos

  -- Esta lista contém diferentes treinos.
  -- Cada treino tem um nome e uma lista de exercícios.

  */

  // Lista de treinos
  List<Workout> workoutList = [
    // Treino padrão
    Workout(name: "Parte Superior do Corpo", exercices: [
      Exercise(name: "Curl de Bíceps", weight: "10Kg", sets: "10", reps: "10")
    ])
  ];

  // Obtém a lista de treinos
  List<Workout> getWorkoutList() {
    return workoutList;
  }

  // Adiciona um treino
  void addWorkout(String name) {
    workoutList.add(Workout(name: name, exercices: []));
  }

  // Adiciona um exercício a um treino
  void addExercise(
    String workoutName,
    String exerciseName,
    String weight,
    String reps,
    String sets,
  ) {
    // Encontra um treino relevante
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    relevantWorkout.exercices.add(
        Exercise(name: exerciseName, weight: weight, sets: sets, reps: reps));
  }

  // Marca um exercício como concluído
  void checkOffExercise(String workoutName, String exerciseName) {
    // Encontra um treino relevante
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    // Encontra um exercício relevante
    Exercise relevantExercise = relevantWorkout.exercices
        .firstWhere((exercise) => exercise.name == exerciseName);

    // Marca o exercício como concluído (implementação necessária)
    // relevantExercise.isChecked = true;
  }

  // Obtém o comprimento do treino

  // Retorna um objeto de treino relevante, dado o nome do treino
  Workout getRelevantWorkout(String workoutName) {
    Workout relevantWorkout =
        workoutList.firstWhere((workout) => workout.name == workoutName);

    return relevantWorkout;
  }

  // Retorna um objeto de exercício relevante, dado o nome do treino e o nome do exercício
}
