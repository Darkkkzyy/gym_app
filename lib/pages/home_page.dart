import 'package:flutter/material.dart';
import 'package:gym_app/data/workout_data.dart';
import 'package:gym_app/pages/workout_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller
  final newWorkoutNameController = TextEditingController();

  // Create a new workout
  void createNewWorkout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Create a New Workout"),
        content: TextField(
          //go see what user typed in
          controller: newWorkoutNameController,
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

  //go to workout page
  void goToWorkoutPage(String workoutName) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WorkoutPage(
            workoutName: workoutName,
          ),
        ));
  }

  // Save function
  void save() {
    //get workout name
    String newWorkoutName = newWorkoutNameController.text;
    //add workout to workout data list
    Provider.of<WorkoutData>(context, listen: false).addWorkout(newWorkoutName);
    // Implement save logic here
    Navigator.of(context).pop(); // Close the dialog
    //clear dialog
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
    newWorkoutNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Workout Tracker"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewWorkout,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: value.getWorkoutList().length,
          itemBuilder: (context, index) => ListTile(
            title: Text(value.getWorkoutList()[index].name),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () =>
                  goToWorkoutPage(value.getWorkoutList()[index].name),
            ),
          ),
        ),
      ),
    );
  }
}
