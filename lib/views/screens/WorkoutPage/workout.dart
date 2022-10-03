import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/views/screens/WorkoutPage/createWorkout.dart';
import 'package:workout_app/views/screens/WorkoutPage/quickWorkout.dart';
import 'package:workout_app/views/screens/WorkoutPage/quickWorkoutSettings.dart';
import 'package:workout_app/views/screens/add_video_screen.dart';
import 'package:workout_app/views/widgets/workoutType.dart';

class Workout extends StatefulWidget {
  const Workout({Key? key}) : super(key: key);

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(AddVideoScreen());
              },
              child: Text(
                'Create Workout',
                style: TextStyle(color: Colors.blue, fontSize: 40),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
