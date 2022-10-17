import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';
import 'package:workout_app/models/progressWT.dart';
import 'package:workout_app/views/widgets/progressChart.dart';
import 'package:workout_app/views/widgets/workoutType.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:workout_app/views/widgets/workout_card.dart';

class BWSquatsData extends StatefulWidget {
  const BWSquatsData({Key? key, required this.workoutType}) : super(key: key);

  final String workoutType;

  @override
  State<BWSquatsData> createState() => _BWSquatsDataState();
}

class _BWSquatsDataState extends State<BWSquatsData> {
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
        items = workoutController.bwSquats.length;
        progressWTList();

        return PageView.builder(
          itemCount: items,
          controller: PageController(initialPage: items, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            data = workoutController.bwSquats[index];

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

  progressWTList() {
    for (int i = 0; i < workoutController.bwSquats.length; i++) {
      Rdata.add(ProgressWT(
          workoutName: workoutController.bwSquats[i].workoutTime,
          weightused: workoutController.bwSquats[i].workoutWeight,
          barColor: charts.ColorUtil.fromDartColor(Colors.green)));
    }
  }
}
