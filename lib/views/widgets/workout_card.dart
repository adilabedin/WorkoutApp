import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:workout_app/views/screens/workout_screens/quick_workout_screen.dart';

class WorkoutCard extends StatelessWidget {
  WorkoutCard(
      {required this.workoutType,
      required this.title,
      required this.description,
      required this.sets,
      required this.reps,
      required this.restTime});

  String workoutType;
  String title;
  String description;
  int sets;
  int reps;
  int restTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.fitness_center_outlined),
              title: Text(title),
              subtitle: Text('sets: ' +
                  sets.toString() +
                  ' reps: ' +
                  reps.toString() +
                  ' rest time: ' +
                  restTime.toString()),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(QuickWorkoutScreen(
                        workoutType: workoutType,
                        workoutName: title,
                        description: description,
                        sets: sets,
                        reps: reps,
                        restTime: restTime));
                  },
                  child: Text('Start Workout'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Read Description'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
