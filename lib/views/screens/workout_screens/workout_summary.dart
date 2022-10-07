import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workout_app/views/screens/video_screens/video_screen.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data_screen.dart';

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WorkoutData();
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
