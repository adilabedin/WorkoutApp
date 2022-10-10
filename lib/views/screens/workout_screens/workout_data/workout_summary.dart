import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';
import 'package:workout_app/views/screens/workout_video_screen/video_screen.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/workout_data_screen.dart';
import 'package:workout_app/views/widgets/workoutType.dart';

class WorkoutSummary extends StatelessWidget {
  WorkoutSummary({
    Key? key,
    required this.workoutName,
    required this.description,
    required this.workoutTime,
    required this.sets,
    required this.reps,
    required this.restTime,
  }) : super(key: key);

  final String workoutName;
  final String description;
  final String workoutTime;
  final String sets;
  final String reps;
  int restTime;

  final String workoutType = "Weight-Training";

  WorkoutDataController workoutDataController =
      Get.put(WorkoutDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Summary'),
        centerTitle: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Column(
        children: [
          Text(workoutType),
          Text(workoutName),
          Text(description),
          Text(workoutTime),
          Text(sets),
          Text(reps),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    workoutDataController.saveWorkout(workoutType, workoutName,
                        description, sets, reps, restTime, workoutTime);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const WorkoutData();
                        },
                      ),
                    );
                  },
                  child: Text('save')),
              SizedBox(width: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red),
                onPressed: () {
                  child:
                  showDialog(
                    context: context,
                    builder: ((context) => AlertDialog(
                          title: Text('Would you like to delete workout?'),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return VideoScreen();
                                      },
                                    ),
                                  );
                                },
                                child: Text('Yes')),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('No'),
                            )
                          ],
                        )),
                  );
                },
                child: Text('delete'),
              )
            ],
          )
        ],
      )),
    );
  }
}
