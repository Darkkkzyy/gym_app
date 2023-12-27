import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  final String exerciseName;
  final String weight;
  final String reps;
  final String sets;
  final bool isCompleted;
  void Function(bool?)? onCheckBoxChanged;

  ExerciseTile({
    super.key,
    required this.exerciseName,
    required this.weight,
    required this.reps,
    required this.sets,
    required this.isCompleted,
    required this.onCheckBoxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: ListTile(
            title: Text(
              exerciseName,
            ),
            subtitle: Row(children: [
              Chip(
                //get the weight
                label: Text("${weight}kg"),
              ),

              //get the reps
              Chip(
                //get the weight
                label: Text("$sets sets"),
              ),

              //get the sets
              Chip(
                //get the weight
                label: Text("$reps reps"),
              ),
            ]),
            trailing: Checkbox(
              value: isCompleted,
              onChanged: (value) => onCheckBoxChanged!(value),
            )));
  }
}
