import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';
import 'package:workout_app/views/screens/home_screen.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/body_weight_Training/bw_workout_data_screen.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/cardio_training/cardio_workout_data_screen.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/weight_training/bench_press_data.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/weight_training/wt_workout_data_screen.dart';

class WorkoutData extends StatefulWidget {
  const WorkoutData({super.key});

  @override
  State<WorkoutData> createState() => _WorkoutDataState();
}

class _WorkoutDataState extends State<WorkoutData> {
  WorkoutDataController workoutData = Get.put(WorkoutDataController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    workoutData.getBenchPress('Weight-Training', 'Bench Press');
    workoutData.getSquats('Weight-Training', 'Squats');
    workoutData.getShoulderPress('Weight-Training', 'Shoulder Press');
    workoutData.getDeadLift('Weight-Training', 'DeadLift');

    workoutData.getRunning('cardio', 'Running');
    workoutData.getSwimming('cardio', 'Swimming');
    workoutData.getCycling('cardio', 'Cycling');

    workoutData.getPushUps('Body-Weight-Training', 'Push Ups');
    workoutData.getPullUps('Body-Weight-Training', 'Pull Ups');
    workoutData.getBWSquats('Body-Weight-Training', 'Squats');
    workoutData.getSitUps('Body-Weight-Training', 'Sit Ups');
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Workout Data'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Get.to(HomeScreen());
              },
            )
          ],
          bottom: const TabBar(tabs: [
            Tab(text: 'Body-Weight'),
            Tab(
              text: 'Weight-Training',
            ),
            Tab(
              text: 'Cardio',
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            Center(
              child: BWWorkoutDataScreen(),
            ),
            Center(
              child: WTWorkoutDataScreen(),
            ),
            Center(
              child: CardioWorkoutDataScreen(),
            ),
          ],
        ),
      ));
}
