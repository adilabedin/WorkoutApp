import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';
import 'package:workout_app/views/widgets/workoutType.dart';

class WorkoutDataDynamicScreen extends StatefulWidget {
  const WorkoutDataDynamicScreen({Key? key, required this.workoutType})
      : super(key: key);

  final String workoutType;

  @override
  State<WorkoutDataDynamicScreen> createState() =>
      _WorkoutDataDynamicScreenState();
}

class _WorkoutDataDynamicScreenState extends State<WorkoutDataDynamicScreen> {
  final WorkoutDataController workoutController =
      Get.put(WorkoutDataController());

  int items = 0;
  var data = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (widget.workoutType == 'Weight-Training') {
          items = workoutController.weightTraining.length;
        } else if (widget.workoutType == 'Cardio') {
          items = workoutController.cardio.length;
        } else if (widget.workoutType == 'Body-Weight-Training') {
          items = workoutController.bodyWeight.length;
        }
        ;
        return PageView.builder(
          itemCount: items,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            if (widget.workoutType == 'Weight-Training') {
              data = workoutController.weightTraining[index];
            } else if (widget.workoutType == 'Cardio') {
              data = workoutController.cardio[index];
            } else if (widget.workoutType == 'Body-Weight-Training') {
              data = workoutController.bodyWeight[index];
            }
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
