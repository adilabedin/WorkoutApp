import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';

class WorkoutDataDynamicScreen extends StatefulWidget {
  WorkoutDataDynamicScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutDataDynamicScreen> createState() =>
      _WorkoutDataDynamicScreenState();
}

class _WorkoutDataDynamicScreenState extends State<WorkoutDataDynamicScreen> {
  final WorkoutDataController workoutController =
      Get.put(WorkoutDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageView.builder(
          itemCount: workoutController.workouts.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final data = workoutController.workouts[index];
            return Column(children: [
              Center(
                child: Text(
                  data.title + ' workout $index',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              )
            ]);
          },
        );
      }),
    );
  }
}
