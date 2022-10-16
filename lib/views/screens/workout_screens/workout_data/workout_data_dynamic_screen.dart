import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';
import 'package:workout_app/models/progressWT.dart';
import 'package:workout_app/views/widgets/progressChart.dart';
import 'package:workout_app/views/widgets/workoutType.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
  int one = 1;
  var data = null;
  final List<ProgressWT> Rdata = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (widget.workoutType == 'Weight-Training') {
          items = workoutController.weightTraining.length;
          progressWTList();
        } else if (widget.workoutType == 'Cardio') {
          items = workoutController.cardio.length;
        } else if (widget.workoutType == 'Body-Weight-Training') {
          items = workoutController.bodyWeight.length;
          progressBWList();
        }

        return PageView.builder(
          itemCount: items,
          controller: PageController(initialPage: items, viewportFraction: 1),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        data.title + ' workout $index',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        data.sets.toString() + ' sets',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        data.reps.toString() + ' reps',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        data.restTime.toString() + ' rest time',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        data.workoutWeight.toString() + ' weight used',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      ProgressChart(
                        data: Rdata,
                      )
                    ],
                  ),
                ),
              )
            ]);
          },
        );
      }),
    );
  }

  progressWTList() {
    for (int i = 0; i < workoutController.weightTraining.length; i++) {
      Rdata.add(ProgressWT(
          workoutName: workoutController.weightTraining[i].workoutTime,
          weightused: workoutController.weightTraining[i].workoutWeight,
          barColor: charts.ColorUtil.fromDartColor(Colors.green)));
    }
  }

  progressBWList() {
    for (int i = 0; i < workoutController.bodyWeight.length; i++) {
      Rdata.add(ProgressWT(
          workoutName: workoutController.bodyWeight[i].workoutTime,
          weightused: workoutController.bodyWeight[i].workoutWeight,
          barColor: charts.ColorUtil.fromDartColor(Colors.green)));
    }
  }
}
