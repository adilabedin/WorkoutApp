import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/workout_data_dynamic_screen.dart';

class UsedWorkoutData extends StatefulWidget {
  const UsedWorkoutData({super.key});

  @override
  State<UsedWorkoutData> createState() => _UsedWorkoutDataState();
}

class _UsedWorkoutDataState extends State<UsedWorkoutData> {
  WorkoutDataController workoutData = Get.put(WorkoutDataController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    workoutData.getWeightWorkout('Weight-Training');
    workoutData.getCardioWorkout('Cardio');
    workoutData.getBodyWorkout('Body-Weight-Training');
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Workout Data'),
          centerTitle: true,
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
                child: WorkoutDataDynamicScreen(
              workoutType: 'Body-Weight-Training',
            )),
            Center(
              child: WorkoutDataDynamicScreen(
                workoutType: 'Weight-Training',
              ),
            ),
            Center(
              child: WorkoutDataDynamicScreen(
                workoutType: 'Cardio',
              ),
            )
          ],
        ),
      ));
}
