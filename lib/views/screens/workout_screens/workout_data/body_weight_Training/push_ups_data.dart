import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';
import 'package:workout_app/models/progressWT.dart';
import 'package:workout_app/views/widgets/progressChart.dart';
import 'package:workout_app/views/widgets/workoutType.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:workout_app/views/widgets/workout_card.dart';

class PushUpsData extends StatefulWidget {
  const PushUpsData({Key? key, required this.workoutType}) : super(key: key);

  final String workoutType;

  @override
  State<PushUpsData> createState() => _PushUpsDataState();
}

class _PushUpsDataState extends State<PushUpsData> {
  final WorkoutDataController workoutController =
      Get.put(WorkoutDataController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    workoutController.getPushUps('Body-Weight-Training', 'Push Ups');
  }

  int items = 0;
  int one = 1;
  var data = null;
  final List<ProgressWT> Rdata = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        items = workoutController.pushUps.length;
        progressBWList();
        return PageView.builder(
          itemCount: items,
          controller: PageController(initialPage: items, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            data = workoutController.pushUps[index];

            return Column(children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        data.title + ' workout ' + index.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                      WorkoutCard(
                          workoutType: data.workoutType,
                          title: data.title,
                          description: data.description,
                          sets: data.sets,
                          reps: data.reps,
                          restTime: data.restTime),
                      Text(
                        'Last Workout: ' + data.workoutTime,
                        style: TextStyle(color: Colors.white, fontSize: 16),
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

  progressBWList() {
    for (int i = 0; i < workoutController.pushUps.length; i++) {
      Rdata.add(ProgressWT(
          workoutName: workoutController.pushUps[i].workoutTime,
          weightused: workoutController.pushUps[i].reps,
          barColor: charts.ColorUtil.fromDartColor(Colors.green)));
    }
  }
}
