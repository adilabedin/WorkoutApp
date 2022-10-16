import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WorkoutCard extends StatelessWidget {
  WorkoutCard(
      {required this.title,
      required this.description,
      required this.sets,
      required this.reps,
      required this.restTime});

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
                  onPressed: () {},
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
