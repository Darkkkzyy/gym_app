import 'package:flutter/material.dart';
import 'package:gym_app/components/exercise_tile.dart';
import 'package:gym_app/data/workout_data.dart';
import 'package:provider/provider.dart';

class WorkoutPage extends StatefulWidget {
  final String workoutName;
  const WorkoutPage({Key? key, required this.workoutName}) : super(key: key);

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  //check box was tapped
  void onCheckBoxChanged(String workoutName, String exerciseName) {
    Provider.of<WorkoutData>(context, listen: false)
        .chekOffExercise(workoutName, exerciseName);
  }

  //text controllers
  final exerciseNameControler = TextEditingController();
  final weightControler = TextEditingController();
  final repsControler = TextEditingController();
  final setsControler = TextEditingController();

  //create a new exercise
  void createNewExercise() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add a new Exercise"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //exercise name
            TextField(
              controller: exerciseNameControler,
            ),

            //weight
            TextField(
              controller: weightControler,
            ),

            //reps
            TextField(
              controller: repsControler,
            ),

            //sets
            TextField(
              controller: setsControler,
            ),
          ],
        ),
        actions: [
          // Save button
          MaterialButton(
            onPressed: save,
            child: const Text("Save"),
          ),

          // Cancel button
          MaterialButton(
            onPressed: cancel,
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  // Save function
  void save() {
    // Get exercise name, weight, sets, reps
    String newExerciseName = exerciseNameControler.text;
    String weight = weightControler.text;
    String sets = setsControler.text;
    String reps = repsControler.text;

    // Add exercise to workout data list
    Provider.of<WorkoutData>(context, listen: false).addExercise(
      widget.workoutName,
      newExerciseName,
      weight,
      reps,
      sets,
    );

    // Implement save logic here
    Navigator.of(context).pop(); // Close the dialog
    // Clear dialog
    clear();
  }

  // Cancel function
  void cancel() {
    // Implement cancel logic here
    Navigator.of(context).pop(); // Close the dialog
    //clear dialog
    clear();
  }

  void clear() {
    exerciseNameControler.clear();
    repsControler.clear();
    weightControler.clear();
    setsControler.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(title: Text(widget.workoutName)),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewExercise,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: value.numberOfExercisesInWorkout(widget.workoutName),
          itemBuilder: (context, index) => ExerciseTile(
            exerciseName: value
                .getRelevantWorkout(widget.workoutName)
                .exercises[index]
                .name,
            weight: value
                .getRelevantWorkout(widget.workoutName)
                .exercises[index]
                .weight,
            reps: value
                .getRelevantWorkout(widget.workoutName)
                .exercises[index]
                .reps,
            sets: value
                .getRelevantWorkout(widget.workoutName)
                .exercises[index]
                .sets,
            isCompleted: value
                .getRelevantWorkout(widget.workoutName)
                .exercises[index]
                .isCompleted,
            onCheckBoxChanged: (val) => onCheckBoxChanged(
                widget.workoutName,
                value
                    .getRelevantWorkout(widget.workoutName)
                    .exercises[index]
                    .name),
          ),
        ),
      ),
    );
  }
}
