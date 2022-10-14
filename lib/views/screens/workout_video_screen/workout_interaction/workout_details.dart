import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';
import 'package:workout_app/views/screens/workout_screens/quick_workout_screen.dart';

class WorkoutDetails extends StatelessWidget {
  const WorkoutDetails(
      {Key? key, required this.data, required this.workoutController})
      : super(key: key);
  final data;
  final WorkoutDataController workoutController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    title: Text(data.workoutType),
                    content: Column(
                      children: [
                        Text(data.title),
                        SizedBox(height: 20),
                        Text(data.description),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(data.sets + ' SETS'),
                            SizedBox(width: 12),
                            Text(data.reps + ' REPS'),
                            SizedBox(width: 12),
                            Text(data.time + ' Rest Time'),
                          ],
                        )
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return QuickWorkoutScreen(
                                      workoutType: data.workoutType,
                                      workoutName: data.title,
                                      description: data.description,
                                      sets: data.sets,
                                      reps: data.reps,
                                      restTime: int.parse(data.time));
                                },
                              ),
                            );
                          },
                          child: Text('Start Workout')),
                    ],
                  ))),
          child: const Icon(
            Icons.file_open,
            size: 40,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          ('Info'),
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
